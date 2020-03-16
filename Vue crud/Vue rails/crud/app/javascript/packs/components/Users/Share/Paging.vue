<template>
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <!--<li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
    <li class="page-item" v-for="link in meta.series" :key="link" :class="{ active: link == meta.page }"
    @click.prevent="changePage(link)">
        <a class="page-link" href="#">{{link}}</a>
    </li>
    <!--<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
  </ul>
</nav>
</template>

<script>
export default {
    props:{
        meta:{
           type: Object,
           required: true
        }
    },
    methods:{
        changePage: function(page){

            if(page == this.meta.data) return;

            this.$emit('change-page', page);
        }
    }
} 
</script>

<style>

</style>