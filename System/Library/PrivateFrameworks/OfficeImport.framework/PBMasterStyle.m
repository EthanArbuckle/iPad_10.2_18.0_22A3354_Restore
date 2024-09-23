@implementation PBMasterStyle

+ (void)readMasterStyleAtom:(void *)a3 baseMasterStyleAtom:(void *)a4 masterBulletStyleAtom:(void *)a5 textListStyle:(id)a6 state:(id)a7
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  int Instance;
  _BOOL4 isDerivedType;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t LevelReference;
  const PptParaProperty *v20;
  const PptParaProperty *v21;
  uint64_t v22;
  void *v23;
  _DWORD *exception;
  _DWORD *v25;
  PptTextMasterStyleAtom *v26;
  id v28;

  v28 = a6;
  v10 = a7;
  if (!a3)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1004;
  }
  v12 = *((_QWORD *)a3 + 6);
  v11 = *((_QWORD *)a3 + 7);
  Instance = EshRecord::getInstance((EshRecord *)a3);
  isDerivedType = PptTextHeaderAtom::isDerivedType(Instance);
  v15 = v11 - v12;
  if (isDerivedType
    && (!a4
     || (unsigned __int16)(v15 >> 3) > (unsigned __int16)((*((_DWORD *)a4 + 14) - *((_DWORD *)a4 + 12)) >> 3)))
  {
    v25 = __cxa_allocate_exception(4uLL);
    *v25 = 1004;
  }
  v26 = (PptTextMasterStyleAtom *)a5;
  if (a5)
    v16 = (unsigned __int16)((unint64_t)(*((_DWORD *)a5 + 14) - *((_DWORD *)a5 + 12)) >> 3);
  else
    v16 = 0;
  if ((v15 & 0x7FFF8) != 0)
  {
    v17 = 0;
    v18 = (unsigned __int16)(v15 >> 3);
    while (1)
    {
      LevelReference = PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a3, (unsigned __int16)v17);
      if (isDerivedType)
        break;
      if (v17)
      {
        v20 = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a3, (unsigned __int16)(v17 - 1));
        goto LABEL_14;
      }
LABEL_15:
      if (v17 >= v16)
        v22 = 0;
      else
        v22 = PptTextMasterStyleAtom::getLevelReference(v26, (unsigned __int16)v17);
      objc_msgSend(v28, "propertiesForListLevel:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[PBParagraphProperties readParagraphProperties:paragraphProperty:bulletStyle:isMaster:state:](PBParagraphProperties, "readParagraphProperties:paragraphProperty:bulletStyle:isMaster:state:", v23, LevelReference, v22, 1, v10);
      +[PBCharacterProperties readCharacterProperties:characterProperty:state:](PBCharacterProperties, "readCharacterProperties:characterProperty:state:", v23, LevelReference + 48, v10);
      objc_msgSend(v23, "setLevel:", v17);

      if (v18 == ++v17)
        goto LABEL_19;
    }
    v20 = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference((PptTextMasterStyleAtom *)a4, (unsigned __int16)v17);
LABEL_14:
    v21 = v20;
    PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)LevelReference, v20);
    PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(LevelReference + 48), (const PptCharProperty *)((char *)v21 + 48));
    goto LABEL_15;
  }
LABEL_19:

}

@end
