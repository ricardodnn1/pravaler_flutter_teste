extension StringToDateBr on String {
   String parseStringToDateBr() {
      var strToDate = this.split('-');
      return strToDate[2]+'/'+strToDate[1]+'/'+strToDate[0]; 
   }
}