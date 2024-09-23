@implementation ZN12SafeBrowsing13LookupContext25addDatabaseUpdateObserverENSt3

_QWORD *___ZN12SafeBrowsing13LookupContext25addDatabaseUpdateObserverENSt3__18functionIFvN7Backend6Google21DatabaseConfigurationEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _DWORD *v5;

  SafeBrowsing::LookupContext::registerForUpdateNotifications(*(SafeBrowsing::LookupContext **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32) + 80;
  v5 = (_DWORD *)(a1 + 80);
  v3 = std::__hash_table<std::__hash_value_type<unsigned int,std::function<void ()(Backend::Google::DatabaseConfiguration)>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::function<void ()(Backend::Google::DatabaseConfiguration)>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::function<void ()(Backend::Google::DatabaseConfiguration)>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::function<void ()(Backend::Google::DatabaseConfiguration)>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v2, (unsigned int *)(a1 + 80), (uint64_t)&std::piecewise_construct, &v5);
  return std::function<void ()(Backend::Google::DatabaseConfiguration)>::operator=(v3 + 3, a1 + 48);
}

@end
