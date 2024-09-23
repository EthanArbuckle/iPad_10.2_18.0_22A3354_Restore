@implementation CRBiDiTransform

+ (id)rearrangeNumericRunsInLogicalString:(id)a3 layoutDirection:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = specialized static CRBiDiTransform.rearrangeNumericRuns(inLogicalString:layoutDirection:)();
  v6 = v5;
  swift_bridgeObjectRelease();
  v7 = (void *)MEMORY[0x1D826D73C](v4, v6);
  swift_bridgeObjectRelease();
  return v7;
}

- (CRBiDiTransform)init
{
  CRBiDiTransform *v2;
  uint64_t v3;
  CRBiDiTransform *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRBiDiTransform;
  v2 = -[CRBiDiTransform init](&v6, sel_init);
  if (v2)
  {
    v3 = ubidi_open();
    v2->_icuBiDiTransform = (UBiDi *)v3;
    if (!v3)
    {
      v4 = 0;
      goto LABEL_6;
    }
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  v4 = v2;
LABEL_6:

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_icuBiDiTransform)
  {
    ubidi_close();
    self->_icuBiDiTransform = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRBiDiTransform;
  -[CRBiDiTransform dealloc](&v3, sel_dealloc);
}

- (id)transformVisualToLogical:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirectionality:(unint64_t)a5 baseDirectionalityPredictionMode:(unint64_t)a6 outTokenizedLogicalOrderIndexes:(id *)a7 outReorderingPermutation:(id *)a8 outMirroredVisualString:(id *)a9 outLogicalBaseDirection:(char *)a10
{
  id *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  int v42;
  int v43;
  unsigned int v44;
  int v45;
  unint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  id v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  id *v66;
  id *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  NSObject *v74;
  const char *v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  _QWORD v79[2];
  id *v80;
  void *v81;
  unint64_t v82;
  id *v83;
  id *v84;
  id v85;
  uint64_t v86;
  os_unfair_lock_t p_lock;
  _QWORD *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  int v94;
  uint8_t v95[88];
  uint8_t buf[4];
  uint64_t v97;
  uint64_t v98;

  v84 = a7;
  v14 = a9;
  v98 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = v15;
  v82 = a4;
  v83 = a8;
  if (a4 == 2)
  {
    objc_msgSend(v15, "_crStringByReversingComposedCharacterSequences");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v16;
  }
  else
  {
    v17 = v15;
    objc_msgSend(v17, "_crStringByReversingComposedCharacterSequences");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  v20 = objc_msgSend(v17, "length");
  v88 = v79;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)v79 - v21;
  objc_msgSend(v17, "getCharacters:", (char *)v79 - v21);
  *(_WORD *)&v22[2 * objc_msgSend(v17, "length")] = 0;
  v86 = objc_msgSend(v17, "length");
  v94 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v23 = 1;
  ubidi_setInverse();
  v24 = v86;
  switch(v86)
  {
    case 0:
      ubidi_setReorderingMode();
      ubidi_setPara();
      if (v94 >= 1)
      {
        CROSLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v26 = "BiDi Visual->Logical transform failed in ubidi_setPara (base directionality prediction)";
        goto LABEL_23;
      }
      v80 = a9;
      v81 = v16;
      LODWORD(v89) = ubidi_getParaLevel();
      if (objc_msgSend(v19, "length"))
      {
        v41 = 0;
        v42 = 0;
        v43 = 0;
        do
        {
          v44 = objc_msgSend(v19, "characterAtIndex:", v41);
          if ((unsigned __int16)(v44 - 1611) >= 8u)
          {
            if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x9002B000900030, (uint16x4_t)vadd_s16(vdup_n_s16(v44), (int16x4_t)0x19004B0F790F8B0))) & 1) != 0|| (v44 & 0xFF00) == 0x600)
            {
              ++v43;
            }
            else
            {
              v45 = (unsigned __int16)((v44 & 0xFFDF) - 65) < 0x1Au || v44 - 248 < 0x158;
              if ((unsigned __int16)(v44 - 192) < 0x17u)
                v45 = 1;
              if (v44 - 216 < 0x1F)
                v45 = 1;
              v42 += v45;
            }
          }
          ++v41;
        }
        while (objc_msgSend(v19, "length") > v41);
      }
      else
      {
        v43 = 0;
        v42 = 0;
      }
      v14 = v80;
      if (a6 < 2 && (v89 & 1) != 0 && (float)((float)v42 / (float)v43) < 0.5)
        v23 = 1;
      else
        v23 = -1;
      v16 = v81;
      if (a10)
        goto LABEL_16;
      goto LABEL_17;
    case 1:
      v23 = 0;
      if (!a10)
        goto LABEL_17;
      goto LABEL_16;
    case 2:
      goto LABEL_15;
    case 3:
      v23 = -2;
      if (!a10)
        goto LABEL_17;
      goto LABEL_16;
    case 4:
      v23 = -1;
LABEL_15:
      if (a10)
LABEL_16:
        *a10 = v23;
LABEL_17:
      ubidi_setReorderingMode();
      ubidi_setPara();
      if (v94 >= 1)
      {
        CROSLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v26 = "BiDi Visual->Logical transform failed in ubidi_setPara";
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      v29 = objc_msgSend(v19, "length");
      MEMORY[0x1E0C80A78](v29);
      v31 = (char *)v79 - v30;
      ubidi_getVisualMap();
      if (v94 >= 1)
      {
        CROSLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v26 = "BiDi Visual->Logical transform failed in ubidi_getVisualMap";
LABEL_23:
          v27 = v25;
          v28 = 2;
LABEL_24:
          _os_log_impl(&dword_1D4FB8000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
        }
LABEL_25:

        os_unfair_lock_unlock(p_lock);
        v32 = 0;
        goto LABEL_26;
      }
      v81 = v16;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v85 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v89 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {
        v35 = 0;
        do
        {
          v36 = objc_msgSend(v19, "length") + ~*(_DWORD *)&v31[4 * v35];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v19, "length") + ~*(_DWORD *)&v31[4 * v35]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "addObject:", v37);

          if (objc_msgSend(v19, "characterAtIndex:", v36) == 32)
          {
            v38 = (void *)objc_msgSend(v34, "copy");
            objc_msgSend(v85, "addObject:", v38);

            objc_msgSend(v34, "removeAllObjects");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v39);

          }
          ++v35;
        }
        while (objc_msgSend(v19, "length") > v35);
      }
      if (objc_msgSend(v34, "count") || !objc_msgSend(v19, "length"))
      {
        v40 = (void *)objc_msgSend(v34, "mutableCopy");
        objc_msgSend(v85, "addObject:", v40);

      }
      v46 = 0x1E0CB3000uLL;
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "_crBiDiMirroredCharacterSet");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v19, "length");
      v16 = v81;
      if (v49)
      {
        v50 = 0;
        while (!objc_msgSend(v48, "characterIsMember:", objc_msgSend(v19, "characterAtIndex:", v50)))
        {
          if (++v50 >= (unint64_t)objc_msgSend(v19, "length"))
            goto LABEL_56;
        }
        v68 = objc_msgSend(v17, "length");
        v79[1] = v79;
        MEMORY[0x1E0C80A78](v68);
        v70 = (char *)v79 - v69;
        v71 = objc_msgSend(v19, "length");
        MEMORY[0x1E0C80A78](v71);
        v73 = (char *)v79 - v72;
        ubidi_writeReordered();
        if (v94 >= 1)
        {
          CROSLogForCategory(0);
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v75 = "BiDi Visual->Logical transform failed in ubidi_writeReordered";
LABEL_91:
            _os_log_impl(&dword_1D4FB8000, v74, OS_LOG_TYPE_ERROR, v75, buf, 2u);
            goto LABEL_92;
          }
          goto LABEL_92;
        }
        ubidi_getLogicalMap();
        if (v94 > 0)
        {
          CROSLogForCategory(0);
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v75 = "BiDi Visual->Logical transform failed in ubidi_getLogicalMap";
            goto LABEL_91;
          }
LABEL_92:

          os_unfair_lock_unlock(p_lock);
          v32 = 0;
          goto LABEL_93;
        }
        v86 = (uint64_t)v48;
        v80 = v14;
        if (objc_msgSend(v19, "length"))
        {
          v76 = 0;
          v77 = -1;
          do
          {
            *(_WORD *)buf = *(_WORD *)&v70[2 * *(int *)&v73[4 * objc_msgSend(v19, "length") + 4 * v77]];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", buf, 1);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "appendString:", v78);

            ++v76;
            --v77;
          }
          while (v76 < objc_msgSend(v19, "length"));
        }
        v46 = 0x1E0CB3000;
      }
      else
      {
LABEL_56:
        v86 = (uint64_t)v48;
        v80 = v14;
        objc_msgSend(v47, "appendString:", v19);
      }
      os_unfair_lock_unlock(p_lock);
      objc_msgSend(*(id *)(v46 + 1952), "string");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v52 = v89;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v91 != v55)
              objc_enumerationMutation(v52);
            objc_msgSend(v47, "substringWithRange:", objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "unsignedIntegerValue"), 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "appendString:", v57);

          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
        }
        while (v54);
      }

      if (v82 == 2)
      {
        v58 = v47;
      }
      else
      {
        if (objc_msgSend(v52, "count"))
        {
          v59 = 0;
          do
          {
            v60 = (void *)MEMORY[0x1E0CB37E8];
            v61 = objc_msgSend(v52, "count");
            objc_msgSend(v52, "objectAtIndexedSubscript:", v59);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "numberWithUnsignedInteger:", v61 + ~objc_msgSend(v62, "unsignedIntegerValue"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setObject:atIndexedSubscript:", v63, v59);

            ++v59;
          }
          while (v59 < objc_msgSend(v52, "count"));
        }
        objc_msgSend(v47, "_crStringByReversingComposedCharacterSequences");
        v58 = (id)objc_claimAutoreleasedReturnValue();
      }
      v64 = v58;
      v65 = v84;
      v66 = v83;
      if (v83)
        *v66 = objc_retainAutorelease(v52);
      if (v65)
        *v65 = (id)objc_msgSend(v85, "copy");
      v67 = v80;
      if (v80)
        *v67 = (id)objc_msgSend(v64, "copy");
      v32 = (void *)objc_msgSend(v51, "copy");

      v16 = v81;
      v48 = (void *)v86;
LABEL_93:

LABEL_26:
      return v32;
    default:
      CROSLogForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 134217984;
      v97 = v24;
      v26 = "BiDi Visual->Logical unsupported base direction: %ld";
      v27 = v25;
      v28 = 12;
      goto LABEL_24;
  }
}

+ (unint64_t)layoutDirectionForVisualString:(id)a3 visualDirectionality:(unint64_t)a4 logicalBaseDirection:(int)a5
{
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  switch(a5)
  {
    case 0:
      v9 = 1;
      goto LABEL_14;
    case 255:
      if (a4 == 1)
      {
        objc_msgSend(v7, "_crStringByReversingExtendedGraphemeClusters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "_isNaturallyRTL"))
          v9 = 2;
        else
          v9 = 1;

        goto LABEL_14;
      }
      if (a4 == 2)
      {
        if (objc_msgSend(v7, "_isNaturallyRTL"))
          v9 = 2;
        else
          v9 = 1;
        goto LABEL_14;
      }
      break;
    case 1:
      v9 = 2;
      goto LABEL_14;
  }
  CROSLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v13 = 134217984;
    v14 = a5;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_FAULT, "Unsupported base direction %lu for layout direction determination.", (uint8_t *)&v13, 0xCu);
  }

  v9 = 0;
LABEL_14:

  return v9;
}

@end
