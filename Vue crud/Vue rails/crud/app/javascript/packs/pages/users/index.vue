<template>
<div>
  <div class="input-group mb-3">
      <div class="input-group-prepend">
        <label class="input-group-text" for="inputGroupSelect01">Per page</label>
      </div>
      <select v-model="perPage">
        <option v-for="option in perPageOptions" :key="option">{{option}}</option>
      </select>
  </div>


  <Paging :meta="meta" v-on:change-page="pageChanged"></Paging>

  <b-button v-b-modal.modal-1>Create new user</b-button>
  <UserModal v-on:new-user-created="newUserCreated"  :user-id="editingUserId" v-on:user-updated="userUpdated"></UserModal>
  <table class="table">
  <thead id="test">
    <tr>
      <th scope="col">#ID</th>
      <th scope="col">Name</th>
      <th scope="col">Description</th>
      <th scope="col">Gender</th>
      <th scope="col">School</th>
    </tr>
  </thead>
  <tbody>
    <UserItem v-for="user in usersList" :key="user.id" :user="user" v-on:edit-user="editUser">      
    </UserItem>
  </tbody>
  </table>

  
</div>
</template>

<script>
import UserItem from '../../components/Users/UserItem';
import Paging from '../../components/Users/Share/Paging';
import UserModal from '../../components/Users/Share/UserModal';
const perPageOptions =[10,20,30, 40,50,60, 700];
export default {
    components:{
       UserItem , Paging , UserModal 
    },
    data() {
        return {
        //
           usersList: [],
           page: 1,
           perPage: 20,
           meta: {},
           editingUserId: null
        };
    },
    created: function() { 
        
        
        this.initConstants()
        this.fetchUserList()
    },
    mounted: function() {
        //console.log('bbb')
        //console.log(document.getElementById('test'))
    },
    methods: {
        initConstants:function(){
          this.perPageOptions =perPageOptions;
        },
        fetchUserList: async function(){
            let params = {
              page: this.page,
              per_page: this.perPage
            }
            
            const result = await this.$axios.get('users.json',{
              params:params
            });
            

            this.usersList  = result.data.users;
            this.meta = result.data.meta;
            this.page = result.data.meta.page;
            //console.log(this.usersList);  // muon thay doi thuoc tinh series co trong
            // component Paging
            //this.$set(this.meta , 'series', result.data.meta.series)
            // add reactive dataa
            //this.meta = Object.assign({}, this.meta, result.data.meta)
        },  //nhan su thay doi tu perPage
        pageChanged: function(page){
          
          this.page = page;
          this.fetchUserList();
        }, // axios cho viec tao ten
        // createNewUser: async function(){
        //     const tokenElement = document.querySelector('meta[name=csrf-token]')

        //     await this.axios.post("users.json",{
        //     user: {
        //        name: 'test1',
        //        description: 'test',
        //        gender: 1,
        //        school_id: 1   
        //     }
        //    },{
        //       headers: {
        //         'X-Requested-With': 'XMLHttpRequest',
        //         'X-CSRF-TOKEN': (tokenElement) ? tokenElement.content : null 
        //       }
        //     })
        // }
        newUserCreated: function(user){
          this.usersList.unshift(user);
        },
        editUser: function(userId){
          //console.log("111")
          this.editingUserId = userId;
          this.$bvModal.show('modal-1');
        },
        userUpdated: function(user){
          console.log(user);
          let updatedIndex = this.usersList.findIndex(u => u.id === user.id)
          //console.log(updatedIndex);
          this.$set(this.userList, updatedIndex, user);
        }
    },    
    watch: {
          perPage: function(){
            this.page = 1;
            this.fetchUserList()
            
          },
          //meta: function(){
          //  console.log(this.meta)
          //}
        
    }
    
};
</script>

<style>

</style>