@implementation ZNK2md18TextDataStringInfo24getBreakingCharacterSetsERPKNSt3

uint64_t **___ZNK2md18TextDataStringInfo24getBreakingCharacterSetsERPKNSt3__13setItNS1_4lessItEENS1_9allocatorItEEEESA__block_invoke_4()
{
  _QWORD *v0;
  uint64_t **v1;
  uint64_t **result;

  v0 = (_QWORD *)operator new();
  v0[2] = 0;
  v0[1] = 0;
  *v0 = v0 + 1;
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeLeadingCharacterSet = (uint64_t)v0;
  v1 = (uint64_t **)operator new();
  result = std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v1, otherFollowingCharacters, ggl::dottedRouteLineShaderVertShaderFunctionAttributes(void)::vertexInput);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeFollowingCharacterSet = (uint64_t)v1;
  return result;
}

uint64_t **___ZNK2md18TextDataStringInfo24getBreakingCharacterSetsERPKNSt3__13setItNS1_4lessItEENS1_9allocatorItEEEESA__block_invoke_3()
{
  uint64_t **v0;
  uint64_t **v1;
  uint64_t **result;

  v0 = (uint64_t **)operator new();
  std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v0, jpLeadingCharacters, jpFollowingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeLeadingCharacterSet = (uint64_t)v0;
  v1 = (uint64_t **)operator new();
  result = std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v1, jpFollowingCharacters, otherFollowingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeFollowingCharacterSet = (uint64_t)v1;
  return result;
}

uint64_t **___ZNK2md18TextDataStringInfo24getBreakingCharacterSetsERPKNSt3__13setItNS1_4lessItEENS1_9allocatorItEEEESA__block_invoke_2()
{
  uint64_t **v0;
  uint64_t **v1;
  uint64_t **result;

  v0 = (uint64_t **)operator new();
  std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v0, traditionalChLeadingCharacters, traditionalChFollowingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeLeadingCharacterSet = (uint64_t)v0;
  v1 = (uint64_t **)operator new();
  result = std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v1, traditionalChFollowingCharacters, jpLeadingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeFollowingCharacterSet = (uint64_t)v1;
  return result;
}

uint64_t **___ZNK2md18TextDataStringInfo24getBreakingCharacterSetsERPKNSt3__13setItNS1_4lessItEENS1_9allocatorItEEEESA__block_invoke()
{
  uint64_t **v0;
  uint64_t **v1;
  uint64_t **result;

  v0 = (uint64_t **)operator new();
  std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v0, simplifiedChLeadingCharacters, simplifiedChFollowingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeLeadingCharacterSet = (uint64_t)v0;
  v1 = (uint64_t **)operator new();
  result = std::set<unsigned short>::set[abi:nn180100]<unsigned short *>(v1, simplifiedChFollowingCharacters, traditionalChLeadingCharacters);
  md::TextDataStringInfo::getBreakingCharacterSets(std::set<unsigned short> const*&,std::set<unsigned short> const*&)const::localeFollowingCharacterSet = (uint64_t)v1;
  return result;
}

@end
