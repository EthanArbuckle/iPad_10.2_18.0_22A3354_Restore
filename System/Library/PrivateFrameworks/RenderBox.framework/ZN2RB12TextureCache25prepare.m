@implementation ZN2RB12TextureCache25prepare

int32x2_t *___ZN2RB12TextureCache25prepare_from_texture_dataERNS_11RenderFrameEP18CGImageTextureDataRKNS0_6ParamsEP12CGColorSpaceNSt3__18optionalIjEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, __n128 a7)
{
  int32x2_t *result;
  unsigned int v9;
  RB::Texture *v12;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t v22;
  void *v23;
  MTLPixelFormat v24;
  unsigned int *v25;
  uint64_t v26;
  int32x2_t *v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  int v31;
  __n128 v32;
  int32x2_t *v33;
  _QWORD v34[5];

  result = *(int32x2_t **)(a1 + 48);
  v9 = *(_DWORD *)(a1 + 80);
  a7.n128_u64[0] = (unint64_t)vmax_s32(vshl_s32(result[1], vneg_s32(vdup_n_s32(v9))), (int32x2_t)0x100000001);
  if (a7.n128_i32[0] != a2 || a7.n128_i32[1] != a3)
    return result;
  v12 = *(RB::Texture **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if ((*(_BYTE *)(a1 + 84) & 2) != 0)
  {
    if (v12)
      v19 = 0;
    else
      v19 = v9 == 0;
    if (v19)
    {
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = ___ZN2RB12TextureCache25prepare_from_texture_dataERNS_11RenderFrameEP18CGImageTextureDataRKNS0_6ParamsEP12CGColorSpaceNSt3__18optionalIjEE_block_invoke_2;
      v34[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
      v22 = *(_QWORD *)(a1 + 64);
      v34[4] = *(_QWORD *)(a1 + 56);
      v23 = (void *)objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v22, a2, a3, *(_DWORD *)(a1 + 88) > 1u);
      objc_msgSend(v23, "setMipmapLevelCount:", *(unsigned int *)(a1 + 88));
      v25 = RB::pixel_format_traits(*(_QWORD *)(a1 + 64), v24);
      if (((*v25 | ((unint64_t)*((unsigned __int16 *)v25 + 2) << 32)) & 0x40000000000) != 0)
        v26 = 17;
      else
        v26 = 1;
      objc_msgSend(v23, "setUsage:", v26);
      objc_msgSend(v23, "setStorageMode:", 0);
      if (*(_BYTE *)(a1 + 92))
        RB::Texture::set_swizzle(v23, (const char *)*(unsigned __int8 *)(a1 + 92));
      result = (int32x2_t *)objc_msgSend(*(id *)(**(_QWORD **)(a1 + 72) + 24), "newTextureWithBytesNoCopy:length:descriptor:deallocator:", a5, a6, v23, v34);
      if (result)
      {
        v27 = result;
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v29 = operator new();
        RB::Texture::Texture(v29, v27, *(unsigned __int8 *)(a1 + 93), 6, *(unsigned __int8 *)(a1 + 92));
        v30 = *(_DWORD **)(v28 + 48);
        *(_QWORD *)(v28 + 48) = v29;
        if (v30)
        {
          v31 = v30[2] - 1;
          v30[2] = v31;
          if (!v31)
            (*(void (**)(_DWORD *))(*(_QWORD *)v30 + 8))(v30);
        }
        result = (int32x2_t *)CGImageTextureDataRetain();
        goto LABEL_32;
      }
    }
  }
  else
  {
    if (v12)
      goto LABEL_16;
    v32 = a7;
    RB::TextureCache::take_available((uint64_t)result, *(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 88), *(_BYTE *)(a1 + 93), 0, *(unsigned __int8 *)(a1 + 92), 0, &v33, (int32x2_t)a7.n128_u64[0]);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(_DWORD **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v33;
    if (v15)
    {
      v16 = v15[2] - 1;
      v15[2] = v16;
      if (!v16)
        (*(void (**)(_DWORD *))(*(_QWORD *)v15 + 8))(v15);
    }
    v12 = *(RB::Texture **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    if (v12)
      goto LABEL_16;
    RB::Texture::alloc(**(_QWORD **)(a1 + 72), *(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 88), *(_BYTE *)(a1 + 93), 0, *(unsigned __int8 *)(a1 + 92), (uint64_t *)&v33, v32);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(int32x2_t **)(v17 + 48);
    *(_QWORD *)(v17 + 48) = v33;
    v33 = result;
    if (result)
    {
      v18 = result[1].i32[0] - 1;
      result[1].i32[0] = v18;
      if (!v18)
        result = (int32x2_t *)(*(uint64_t (**)(int32x2_t *))(*(_QWORD *)result + 8))(result);
    }
    v12 = *(RB::Texture **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    if (v12)
    {
LABEL_16:
      result = (int32x2_t *)RB::Texture::replace(v12, *(_DWORD *)(a1 + 80), a5, a4);
LABEL_32:
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }
  return result;
}

@end
