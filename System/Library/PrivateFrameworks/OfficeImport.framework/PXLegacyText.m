@implementation PXLegacyText

+ (void)textMasterStyleOfType:(int)a3 state:(id)a4
{
  __int16 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;

  v4 = a3;
  v5 = a4;
  objc_opt_class();
  objc_msgSend(v5, "legacyTextGlobals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "firstChildOfType:", 1010);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childOfType:instance:", 4003, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v8, "eshObject");
  if (v9)
  else
    v10 = 0;

  return v10;
}

+ (void)readLegacyTextGlobalsFromData:(id)a3 state:(id)a4
{
  void *v5;
  PBPresentationReaderState *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  pptTreeWithData((NSData *)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLegacyTextGlobals:", v5);
  v6 = -[PBPresentationReaderState initWithReader:tgtPresentation:]([PBPresentationReaderState alloc], "initWithReader:tgtPresentation:", 0, 0);
  objc_opt_class();
  objc_msgSend(v9, "legacyTextGlobals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "firstChildOfType:", 1010);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBPresentation setFontEntites:environmentHolder:](PBPresentation, "setFontEntites:environmentHolder:", v6, v8);
  +[PBProgTag readBulletImagesFromContainerParent:state:](PBProgTag, "readBulletImagesFromContainerParent:state:", v7, v6);
  objc_msgSend(v9, "setLegacyPresentationState:", v6);

}

+ (void)readLegacyTextFromData:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  const void *v14;
  unsigned int *v15;
  uint64_t v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  EshRecord *v20;
  int DataLength;
  EshRecord *v22;
  int v23;
  int v24;
  ESDObject *v25;
  uint64_t v26;
  PptParaRun *v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  PptCharRun *v31;
  PptTextMasterStyleAtom *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  const PptParaProperty *LevelReference;
  uint64_t v37;
  unint64_t v38;
  unsigned __int16 v39;
  int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  NSData *v52;

  v52 = (NSData *)a3;
  v8 = a4;
  v50 = a5;
  objc_msgSend(v50, "legacyPresentationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textBody");
  v10 = objc_claimAutoreleasedReturnValue();
  pptTreeWithData(v52);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  objc_msgSend(v12, "firstChildOfType:", 3999);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (const void *)objc_msgSend(v13, "eshObject");
  v51 = v9;
  v49 = (void *)v10;
  if (v14)
  else
    v15 = 0;

  v16 = v15[12];
  objc_msgSend(v12, "firstChildOfType:", 4012);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentBulletStyle:macCharStyle:");
  objc_msgSend(v12, "firstChildOfType:", 4001);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (const void *)objc_msgSend(v17, "eshObject");
  if (v18)
  else
    v19 = 0;

  v20 = (EshRecord *)ESDAtomAccess<PptTextBytesAtom>::first(v12, 0);
  if (v20)
  {
    DataLength = EshRecord::getDataLength(v20);
    if (v19)
      goto LABEL_21;
    goto LABEL_17;
  }
  v22 = (EshRecord *)ESDAtomAccess<PptTextCharsAtom>::first(v12, 0);
  if (!v22)
  {
    DataLength = 0;
    if (v19)
      goto LABEL_21;
    goto LABEL_17;
  }
  v23 = EshRecord::getDataLength(v22);
  if (v23 >= 0)
    v24 = v23;
  else
    v24 = v23 + 1;
  DataLength = v24 >> 1;
  if (!v19)
  {
LABEL_17:
    v19 = operator new();
    PptTextBlockStylingAtom::PptTextBlockStylingAtom((PptTextBlockStylingAtom *)v19);
    *(_DWORD *)(v19 + 96) = DataLength;
    v25 = -[ESDObject initWithEshObject:]([ESDObject alloc], "initWithEshObject:", v19);
    if (DataLength)
      v26 = 2;
    else
      v26 = 1;
    objc_msgSend(v12, "insertChild:at:", v25, v26);

  }
LABEL_21:
  if (((*(_QWORD *)(v19 + 56) - *(_QWORD *)(v19 + 48)) & 0x7FFFFFFF8) == 0)
  {
    v27 = (PptParaRun *)operator new();
    PptParaRun::PptParaRun(v27);
    *(_DWORD *)v27 = DataLength + 1;
    *((_WORD *)v27 + 2) = 0;
    EshDgg::addIdCluster((_QWORD *)v19, (uint64_t)v27);
  }
  if (((*(_QWORD *)(v19 + 80) - *(_QWORD *)(v19 + 72)) & 0x7FFFFFFF8) == 0)
  {
    v28 = *(_QWORD *)(v19 + 48);
    if (((*(_QWORD *)(v19 + 56) - v28) & 0x7FFFFFFF8) != 0)
    {
      v29 = 0;
      do
      {
        v30 = **(_DWORD **)(v28 + 8 * v29);
        v31 = (PptCharRun *)operator new();
        PptCharRun::PptCharRun(v31);
        v31->var0 = v30;
        PptTextBlockStylingAtom::addCharRun((PptTextBlockStylingAtom *)v19, v31);
        ++v29;
        v28 = *(_QWORD *)(v19 + 48);
      }
      while (v29 < ((unint64_t)(*(_QWORD *)(v19 + 56) - v28) >> 3));
    }
  }
  v47 = v8;
  v32 = (PptTextMasterStyleAtom *)objc_msgSend(a1, "textMasterStyleOfType:state:", v16, v50);
  v33 = *(_QWORD *)(v19 + 48);
  if (((*(_QWORD *)(v19 + 56) - v33) & 0x7FFFFFFF8) != 0)
  {
    v34 = 0;
    do
    {
      v35 = *(_QWORD *)(v33 + 8 * v34);
      LevelReference = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference(v32, *(unsigned __int16 *)(v35 + 4));
      PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)(v35 + 8), LevelReference);
      ++v34;
      v33 = *(_QWORD *)(v19 + 48);
    }
    while (v34 < ((unint64_t)(*(_QWORD *)(v19 + 56) - v33) >> 3));
  }
  v37 = *(_QWORD *)(v19 + 72);
  if (((*(_QWORD *)(v19 + 80) - v37) & 0x7FFFFFFF8) != 0)
  {
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = -1;
    do
    {
      if (v41 >= v40)
      {
        v43 = *(_QWORD *)(v19 + 48);
        do
        {
          if (++v42 >= ((unint64_t)(*(_QWORD *)(v19 + 56) - v43) >> 3))
            std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
          v44 = *(_QWORD *)(v43 + 8 * v42);
          v40 += *(_DWORD *)v44;
        }
        while (v41 >= v40);
        v39 = *(_WORD *)(v44 + 4);
      }
      v45 = *(_QWORD *)(v37 + 8 * v38);
      v46 = PptTextMasterStyleAtom::getLevelReference(v32, v39);
      PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)(v45 + 4), (const PptCharProperty *)(v46 + 48));
      v41 += *(_DWORD *)v45;
      ++v38;
      v37 = *(_QWORD *)(v19 + 72);
    }
    while (v38 < ((unint64_t)(*(_QWORD *)(v19 + 80) - v37) >> 3));
  }
  +[PBTextBlock readClientTextBox:textBody:state:](PBTextBlock, "readClientTextBox:textBody:state:", v12, v49, v51);

}

@end
