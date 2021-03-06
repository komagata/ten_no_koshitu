import Vue from 'vue/dist/vue.esm'
import User from '../components/user.vue'
import Datepicker from 'vuejs-datepicker'
import { ja } from 'vuejs-datepicker/dist/locale'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({ // eslint-disable-line
    el: '#table',
    data: {
      all: true,
      start: '',
      end: '',
      DatePickerFormat: 'yyyy-MM-dd',
      ja: ja
    },
    components: {
      User,
      Datepicker
    },
    computed: {
      term: function () {
        if (this.all === true) {
          return { all: true }
        } else {
          return { start: this.start, end: this.end }
        }
      },
      changeAll: {
        get: function () {
          return this.all
        },
        set: function (boolean) {
          this.all = boolean
          if (this.all === true) {
            this.start = ''
            this.end = ''
          }
        }
      },
      changeStart: {
        get: function () {
          return this.start
        },
        set: function (date) {
          this.start = date
          if (!(this.start === '')) {
            this.all = false
          }
        }
      },
      changeEnd: {
        get: function () {
          return this.end
        },
        set: function (date) {
          this.end = date
          if (!(this.end === '')) {
            this.all = false
          }
        }
      }
    }
  })
})
