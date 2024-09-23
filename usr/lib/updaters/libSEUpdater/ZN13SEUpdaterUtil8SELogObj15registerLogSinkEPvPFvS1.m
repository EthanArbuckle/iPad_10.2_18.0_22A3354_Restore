@implementation ZN13SEUpdaterUtil8SELogObj15registerLogSinkEPvPFvS1

_QWORD *___ZN13SEUpdaterUtil8SELogObj15registerLogSinkEPvPFvS1_PKcE_block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  void *exception;
  std::string *v4;
  __int128 v5;
  std::string v6;
  __int128 v7;
  std::string::size_type v8;

  v1 = result[5];
  if (!v1)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v6, "Assertion: ");
    v4 = std::string::append(&v6, "logSink");
    v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
    v8 = v4->__r_.__value_.__r.__words[2];
    v7 = v5;
    v4->__r_.__value_.__l.__size_ = 0;
    v4->__r_.__value_.__r.__words[2] = 0;
    v4->__r_.__value_.__r.__words[0] = 0;
    MEMORY[0x22078A520](exception, &v7);
  }
  v2 = result[4];
  *(_QWORD *)(v2 + 32) = v1;
  *(_QWORD *)(v2 + 40) = result[6];
  return result;
}

@end
