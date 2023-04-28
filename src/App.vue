<script setup lang="ts">
import TheHeader from "./components/TheHeader.vue";
import TheSection from "./components/Section.vue";
import { computed } from "vue";
</script>

<template>
  <v-app>
    <v-main>
      <TheHeader />
      <TheSection />
    </v-main>
  </v-app>
</template>

<style scoped></style>
