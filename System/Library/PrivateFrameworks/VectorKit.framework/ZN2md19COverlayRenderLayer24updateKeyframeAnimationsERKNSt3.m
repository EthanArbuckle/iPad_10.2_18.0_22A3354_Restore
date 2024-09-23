@implementation ZN2md19COverlayRenderLayer24updateKeyframeAnimationsERKNSt3

_QWORD *___ZN2md19COverlayRenderLayer24updateKeyframeAnimationsERKNSt3__16vectorIPNS_21MapTileDataRenderableINS_15OverlayTileDataEEENS1_9allocatorIS6_EEEEPKNS_15OverlaysContextE_block_invoke(uint64_t a1, float a2)
{
  unsigned int v2;
  float v3;
  float v4;
  float v5;
  unsigned int v6;
  __int16 v7;
  float v8;
  float v9;
  _QWORD *result;

  v2 = *(unsigned __int16 *)(a1 + 68);
  v3 = (float)v2 * a2;
  v4 = floorf(v3);
  v5 = roundf(v3);
  if (!*(_BYTE *)(a1 + 56))
    v4 = v5;
  v6 = (int)v4 % v2;
  if ((unsigned __int16)v6 + 1 == v2)
    v7 = 0;
  else
    v7 = v6 + 1;
  v8 = v3 - (float)(unsigned __int16)v6;
  if (*(_BYTE *)(a1 + 70))
    v9 = v8;
  else
    v9 = 0.0;
  result = std::__hash_table<std::__hash_value_type<unsigned int,md::COverlayRenderLayer::KeyframeState>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,md::COverlayRenderLayer::KeyframeState>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,md::COverlayRenderLayer::KeyframeState>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,md::COverlayRenderLayer::KeyframeState>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((float *)(*(_QWORD *)(a1 + 32) + 400), *(_DWORD *)(a1 + 64), (_DWORD *)(a1 + 64));
  *((_WORD *)result + 10) = v6;
  *((_WORD *)result + 11) = v7;
  *((float *)result + 6) = v9;
  return result;
}

@end
