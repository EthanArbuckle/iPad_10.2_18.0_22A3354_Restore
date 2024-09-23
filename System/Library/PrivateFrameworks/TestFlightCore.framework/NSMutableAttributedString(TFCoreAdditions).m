@implementation NSMutableAttributedString(TFCoreAdditions)

- (void)tf_addLanguageAwareness:()TFCoreAdditions
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t CharacterAtIndex;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _BOOL4 v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSUInteger v40;
  uint64_t v41;
  uint64_t *v42;
  id v43;
  id v44;
  int v45;
  void *v46;
  NSRange v47;
  id v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  unint64_t v57;
  __CFString *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSUInteger v62;
  uint64_t v63;
  void *v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  UniChar buffer[8];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __CFString *v91;
  const UniChar *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSRange v98;
  void *v99;
  _QWORD v100[4];
  NSRange v101;

  v100[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v64 = a1;
  objc_msgSend(a1, "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v5, "length");
  if (v6)
  {
    v7 = v6;
    v60 = v4;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    *(_OWORD *)buffer = 0u;
    v76 = 0u;
    v91 = v5;
    v94 = 0;
    v95 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v92 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v73 = 0;
    v10 = 0;
    v69 = 0uLL;
    v11 = 0;
    v61 = 0;
    v62 = 0;
    v71 = 0;
    v12 = 0;
    v65 = 0;
    v68 = 0;
    v57 = v7 - 1;
    v58 = v5;
    v96 = 0;
    v97 = 0;
    v93 = CStringPtr;
    v63 = *MEMORY[0x24BDF66E0];
    v59 = *MEMORY[0x24BDF6628];
    v70 = -1;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v66 = v7;
    v67 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = v7;
    while (1)
    {
      v72 = v11;
      v74 = 0;
      CharacterAtIndex = TFAMPCFStringGetCharacterAtIndex(buffer, v10, &v74);
      v17 = CharacterAtIndex;
      v18 = 0;
      v19 = v74;
      v20 = v74 + v10;
      LODWORD(v21) = 1;
      if ((CharacterAtIndex - 8206) < 2 || (_DWORD)CharacterAtIndex == 0)
      {
        v10 += v74;
        v23 = 1;
        v24 = 1;
      }
      else
      {
        if ((_DWORD)CharacterAtIndex == 65532)
        {
LABEL_12:
          v25 = 1;
          v26 = 1;
        }
        else
        {
          v27 = MEMORY[0x219A0D168](CharacterAtIndex);
          v28 = 0;
          v18 = 0;
          v21 = 1;
          v25 = 1;
          v26 = 1;
          switch(v27)
          {
            case 0:
              goto LABEL_34;
            case 1:
            case 13:
              v27 = 0;
              v28 = 0;
              v21 = 2;
              goto LABEL_34;
            case 2:
            case 5:
              v27 = 0;
              v28 = 0;
              v21 = 3;
              goto LABEL_34;
            case 3:
              v27 = 0;
              v28 = 0;
              v21 = 5;
              goto LABEL_34;
            case 4:
              v27 = 0;
              v28 = 0;
              v21 = 6;
              goto LABEL_34;
            case 6:
              v27 = 0;
              v28 = 0;
              v21 = 4;
              goto LABEL_34;
            case 7:
              v18 = 1;
              if (v17 == 13 && v20 <= v57)
              {
                v29 = TFAMPCFStringGetCharacterAtIndex(buffer, v20, 0);
                v18 = 1;
                LODWORD(v21) = 1;
                if (v29 == 10)
                {
                  ++v19;
                  ++v20;
                }
                v25 = 1;
                v26 = 1;
              }
              else
              {
                LODWORD(v21) = 1;
                v25 = 1;
              }
              break;
            case 8:
            case 9:
              break;
            case 10:
            case 18:
              v27 = 0;
              v28 = 0;
              v21 = 13;
              goto LABEL_34;
            case 11:
            case 12:
            case 14:
            case 15:
            case 16:
              v27 = 0;
              v28 = 0;
              v21 = 7;
              goto LABEL_34;
            case 17:
              v27 = 0;
              v28 = 0;
              v21 = 14;
              goto LABEL_34;
            case 19:
            case 20:
            case 21:
              v28 = v61 == 0;
              v27 = 1;
              v21 = 8;
              ++v61;
              goto LABEL_34;
            case 22:
              if (v61)
              {
                v28 = --v61 == 0;
              }
              else
              {
                v61 = 0;
                v28 = 0;
              }
              v27 = 1;
              v21 = 9;
              goto LABEL_34;
            default:
              v21 = 0;
              v27 = 0;
              v28 = 0;
LABEL_34:
              v12 += v19;
              if (v61 || v28)
              {
                v18 = 0;
                LODWORD(v21) = 0;
                v71 |= v70 != -1;
LABEL_39:
                v25 = v27;
              }
              else
              {
                v61 = 0;
                v18 = 0;
                v30 = v21;
                LODWORD(v21) = 0;
                v25 = v27;
                v26 = v27;
                switch(v30)
                {
                  case 0:
                  case 7:
                  case 13:
                  case 14:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v61 = 0;
                    goto LABEL_12;
                  case 1:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v61 = 0;
                    v49 = 1;
                    v50 = v71;
                    if ((unint64_t)(v70 + 1) >= 2)
                      v50 = 1;
                    v71 = v50;
                    v25 = 1;
                    v26 = 1;
                    if ((unint64_t)(v70 + 1) < 2)
                      v49 = 0;
                    goto LABEL_132;
                  case 2:
                    v25 = 1;
                    if (v70 == -1)
                    {
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v61 = 0;
                      v26 = 1;
                      v49 = 1;
LABEL_132:
                      v70 = v49;
                    }
                    else
                    {
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v61 = 0;
                      v51 = v71;
                      if (v70 != 1)
                        v51 = 1;
                      v71 = v51;
                      v26 = 1;
                      v70 = v70 == 1;
                      v25 = 1;
                    }
                    goto LABEL_41;
                  case 3:
                    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
                      {
                        v25 = 1;
                        v52 = v73;
                        v10 = v13;
                        goto LABEL_130;
                      }
                    }
                    else
                    {
                      v10 = v14;
                    }
                    v25 = v27;
                    v52 = v68;
LABEL_130:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v61 = 0;
                    v68 = v52 + v19;
                    v67 = v52 + v19 + v10 - 1;
                    v14 = v10;
                    break;
                  case 4:
                    v53 = v14 == 0x7FFFFFFFFFFFFFFFLL;
                    v54 = v68;
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v61 = 0;
                    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
                      v54 = v19 + v68;
                    v68 = v54;
                    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
                      v14 = 0x7FFFFFFFFFFFFFFFLL;
                    if (v53)
                      v25 = 1;
                    else
                      v25 = v27;
                    break;
                  case 5:
                    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
                      goto LABEL_126;
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v61 = 0;
                    v73 += v19;
                    v14 = 0x7FFFFFFFFFFFFFFFLL;
                    v55 = v13 == 0x7FFFFFFFFFFFFFFFLL;
                    goto LABEL_123;
                  case 6:
                    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v61 = 0;
                      v14 = 0x7FFFFFFFFFFFFFFFLL;
                      v55 = v13 == 0x7FFFFFFFFFFFFFFFLL;
                      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
                        v56 = 0;
                      else
                        v56 = v19;
                      v73 += v56;
LABEL_123:
                      if (v55)
                        v13 = v10;
                    }
                    else
                    {
LABEL_126:
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v61 = 0;
                      v68 += v19;
                    }
                    goto LABEL_39;
                  case 8:
                  case 9:
                  case 10:
                  case 11:
                  case 12:
                    goto LABEL_41;
                  default:
                    LODWORD(v21) = 0;
                    goto LABEL_39;
                }
              }
              v26 = v27;
              break;
          }
        }
LABEL_41:
        v24 = v21;
        LOBYTE(v21) = v25 != 0;
        v23 = v26 != 0;
        v10 = v20;
      }
      if (v10 == v15)
      {
        LOBYTE(v21) = 1;
        v23 = 1;
        v31 = 1;
      }
      else
      {
        v31 = v24;
      }
      if (v10 == v15)
        v32 = 1;
      else
        v32 = v18;
      v33 = (v21 & (v13 != 0x7FFFFFFFFFFFFFFFLL)) == 0;
      v34 = v73;
      if (!v33)
        v34 = 0;
      v73 = v34;
      if (!v33)
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      if (v23 && v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((v17 & 0x1FFFFE) != 0x200E)
        {
          if (v67 < v68 + v14 - 1)
            v35 = v67 - v14 + 1;
          else
            v35 = v68;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v100[0] = v36;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "addAttribute:value:range:", v63, v37, v14, v35);

          v15 = v66;
        }
        v67 = 0x7FFFFFFFFFFFFFFFLL;
        v68 = 0;
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 = v19 + v72;
      if (!v31)
        goto LABEL_95;
      if (v70 == 1)
      {
        *(_QWORD *)&v69 = v69 + 1;
      }
      else if (!v70)
      {
        ++*((_QWORD *)&v69 + 1);
      }
      if (((v12 != 0) & v71) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v38;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "addAttribute:value:range:", v63, v39, v65, v12);

        v15 = v66;
      }
      if (v32)
        break;
      v12 = 0;
      v71 = 0;
      v70 = -1;
      v65 = v10;
LABEL_95:
      if (v10 == v15)
      {
        v4 = v60;
        v5 = v58;
        goto LABEL_133;
      }
    }
    if ((_QWORD)v69 && (double)(unint64_t)v69 / (double)(unint64_t)(v69 + *((_QWORD *)&v69 + 1)) >= 0.4)
    {
      v40 = v62;
      if (defaultParagraphStyle_sOnceForRightToLeft != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForRightToLeft, &__block_literal_global_6);
      v41 = 1;
      v42 = &defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
    }
    else if (v69 == 0)
    {
      v40 = v62;
      if (defaultParagraphStyle_sOnceForNatural != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForNatural, &__block_literal_global_5);
      v41 = -1;
      v42 = &defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
    }
    else
    {
      v40 = v62;
      if (defaultParagraphStyle_sOnceForLeftToRight != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForLeftToRight, &__block_literal_global_4);
      v41 = 0;
      v42 = &defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
    }
    v43 = (id)*v42;
    if (v60)
    {
      objc_msgSend(v60, "tf_paragraphStyleWithBaseWritingDirection:", v41);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = 1;
LABEL_92:

      if (v45)
        objc_msgSend(v64, "addAttribute:value:range:", v59, v44, v40, v11);

      v12 = 0;
      v71 = 0;
      v11 = 0;
      v69 = 0uLL;
      v70 = -1;
      v65 = v10;
      v62 = v10;
      v15 = v66;
      goto LABEL_95;
    }
    v98.location = 0;
    v98.length = 0;
    objc_msgSend(v64, "attribute:atIndex:effectiveRange:", v59, v40, &v98);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v101.location = v40;
      v101.length = v19 + v72;
      v47 = NSIntersectionRange(v98, v101);
      if (v47.location == v40 && v47.length == v11 && objc_msgSend(v46, "baseWritingDirection") == v41)
      {
        v44 = v46;
        v45 = 0;
LABEL_91:

        goto LABEL_92;
      }
      objc_msgSend(v46, "tf_paragraphStyleWithBaseWritingDirection:", v41);
      v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = v43;
    }
    v44 = v48;
    v45 = 1;
    goto LABEL_91;
  }
LABEL_133:

}

@end
