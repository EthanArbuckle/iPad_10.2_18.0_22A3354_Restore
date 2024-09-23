@implementation ZN7WebCore16AttributedString43fromNSAttributedStringAndDocumentAttributesEON3WTF9RetainPtrI18NSAttributedStringEEONS2

_OWORD *___ZN7WebCore16AttributedString43fromNSAttributedStringAndDocumentAttributesEON3WTF9RetainPtrI18NSAttributedStringEEONS2_I12NSDictionaryEE_block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  _OWORD *result;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char v29;

  v6 = *(_QWORD *)(a1[4] + 8);
  WebCore::extractDictionary(&v26, a2, *(_QWORD *)(a1[5] + 8) + 48, *(_QWORD *)(a1[6] + 8) + 48, *(_QWORD *)(a1[7] + 8) + 48);
  *(_QWORD *)&v27 = a3;
  *((_QWORD *)&v27 + 1) = a4;
  v8 = v26;
  v26 = 0;
  v28 = v8;
  result = (_OWORD *)(v6 + 56);
  v10 = *(unsigned int *)(v6 + 68);
  if ((_DWORD)v10 == *(_DWORD *)(v6 + 64))
  {
    result = (_OWORD *)WTF::Vector<std::pair<WebCore::AttributedString::Range,WTF::HashMap<WTF::String,WebCore::AttributedString::AttributeValue,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WebCore::AttributedString::AttributeValue>,WTF::HashTableTraits>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)result, v10 + 1, (unint64_t)&v27);
    v11 = *(_QWORD *)(v6 + 56) + 24 * *(unsigned int *)(v6 + 68);
    *(_OWORD *)v11 = *result;
    *(_QWORD *)(v11 + 16) = 0;
    v12 = (_QWORD *)(v11 + 16);
    v13 = (uint64_t *)(result + 1);
  }
  else
  {
    v13 = &v28;
    v14 = (_OWORD *)(*(_QWORD *)result + 24 * v10);
    *v14 = v27;
    v12 = v14 + 1;
  }
  v15 = *v13;
  *v13 = 0;
  *v12 = v15;
  ++*(_DWORD *)(v6 + 68);
  v16 = v28;
  if (v28)
  {
    v17 = *(unsigned int *)(v28 - 4);
    if ((_DWORD)v17)
    {
      v18 = v28;
      do
      {
        v19 = *(WTF::StringImpl **)v18;
        if (*(_QWORD *)v18 != -1)
        {
          v20 = *(unsigned int *)(v18 + 48);
          if ((_DWORD)v20 != -1)
          {
            ((void (*)(char *, uint64_t))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJdN3WTF6StringENS6_3URLENS6_3RefIN7WebCore4FontENS6_12RawPtrTraitsISB_EENS6_21DefaultRefDerefTraitsISB_EEEENS6_6VectorIS7_Lm0ENS6_15CrashOnOverflowELm16ENS6_10FastMallocEEENSH_IdLm0ESI_Lm16ESJ_EENSA_16AttributedString33ParagraphStyleWithTableAndListIDsENS6_9RetainPtrI20NSPresentationIntentEENSO_I8NSShadowEENSO_I6NSDateEENSM_16ColorFromCGColorENSM_22ColorFromPlatformColorENSA_37MultiRepresentationHEICAttachmentDataENSA_25TextAttachmentFileWrapperENSA_26TextAttachmentMissingImageEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRS12_EEEDcOS13_DpOT0____fmatrix[v20])(&v29, v18 + 8);
            v19 = *(WTF::StringImpl **)v18;
          }
          *(_DWORD *)(v18 + 48) = -1;
          *(_QWORD *)v18 = 0;
          if (v19)
          {
            if (*(_DWORD *)v19 == 2)
              WTF::StringImpl::destroy(v19, v7);
            else
              *(_DWORD *)v19 -= 2;
          }
        }
        v18 += 56;
        --v17;
      }
      while (v17);
    }
    result = (_OWORD *)WTF::fastFree((WTF *)(v16 - 16), v7);
  }
  v21 = v26;
  if (v26)
  {
    v22 = *(unsigned int *)(v26 - 4);
    if ((_DWORD)v22)
    {
      v23 = v26;
      do
      {
        v24 = *(WTF::StringImpl **)v23;
        if (*(_QWORD *)v23 != -1)
        {
          v25 = *(unsigned int *)(v23 + 48);
          if ((_DWORD)v25 != -1)
          {
            ((void (*)(char *, uint64_t))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJdN3WTF6StringENS6_3URLENS6_3RefIN7WebCore4FontENS6_12RawPtrTraitsISB_EENS6_21DefaultRefDerefTraitsISB_EEEENS6_6VectorIS7_Lm0ENS6_15CrashOnOverflowELm16ENS6_10FastMallocEEENSH_IdLm0ESI_Lm16ESJ_EENSA_16AttributedString33ParagraphStyleWithTableAndListIDsENS6_9RetainPtrI20NSPresentationIntentEENSO_I8NSShadowEENSO_I6NSDateEENSM_16ColorFromCGColorENSM_22ColorFromPlatformColorENSA_37MultiRepresentationHEICAttachmentDataENSA_25TextAttachmentFileWrapperENSA_26TextAttachmentMissingImageEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRS12_EEEDcOS13_DpOT0____fmatrix[v25])(&v29, v23 + 8);
            v24 = *(WTF::StringImpl **)v23;
          }
          *(_DWORD *)(v23 + 48) = -1;
          *(_QWORD *)v23 = 0;
          if (v24)
          {
            if (*(_DWORD *)v24 == 2)
              WTF::StringImpl::destroy(v24, v7);
            else
              *(_DWORD *)v24 -= 2;
          }
        }
        v23 += 56;
        --v22;
      }
      while (v22);
    }
    return (_OWORD *)WTF::fastFree((WTF *)(v21 - 16), v7);
  }
  return result;
}

@end
