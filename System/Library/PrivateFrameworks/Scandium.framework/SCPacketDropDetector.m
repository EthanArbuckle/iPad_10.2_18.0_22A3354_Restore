@implementation SCPacketDropDetector

- (void)handlePacketWithReportID:(unsigned __int8)a3 frameIndex:(unsigned __int16)a4 size:(unint64_t)a5
{
  scandium::PacketDropDetector::handle_packet((scandium::PacketDropDetector *)&self->_detector, a3, a4, a5);
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned char,unsigned short>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,unsigned short>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,unsigned short>>>::~__hash_table((uint64_t)&self->_detector);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

@end
