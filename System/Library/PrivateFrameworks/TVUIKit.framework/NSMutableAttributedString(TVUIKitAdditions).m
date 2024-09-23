@implementation NSMutableAttributedString(TVUIKitAdditions)

- (void)tv_addLanguageAwareness:()TVUIKitAdditions
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t CharacterAtIndex;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSUInteger v38;
  uint64_t v39;
  uint64_t *v40;
  id v41;
  uint64_t v42;
  id v43;
  int v44;
  void *v45;
  NSRange v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  NSUInteger v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int8 v61;
  uint64_t v62;
  UniChar buffer[8];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __CFString *v79;
  const UniChar *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSRange v86;
  _QWORD v87[4];
  NSRange v88;

  v87[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v55 = a1;
  objc_msgSend(a1, "string");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = -[__CFString length](v5, "length");
  if (v6)
  {
    v7 = v6;
    v53 = v4;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    *(_OWORD *)buffer = 0u;
    v64 = 0u;
    v79 = v5;
    v82 = 0;
    v83 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v80 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v50 = v5;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v56 = 0;
    v57 = 0;
    v54 = 0;
    v61 = 0;
    v14 = 0;
    v84 = 0;
    v85 = 0;
    v81 = CStringPtr;
    v49 = v7 - 1;
    v15 = -1;
    v51 = *MEMORY[0x24BEBB3A8];
    v52 = *MEMORY[0x24BEBB450];
    v60 = 0x7FFFFFFFFFFFFFFFLL;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    v58 = v7;
    while (1)
    {
      v59 = v16;
      v62 = 0;
      CharacterAtIndex = AMPCFStringGetCharacterAtIndex(buffer, v10, &v62);
      v18 = 0;
      v19 = v62;
      v20 = v62 + v10;
      LODWORD(v21) = 1;
      if ((CharacterAtIndex - 8206) < 2 || (_DWORD)CharacterAtIndex == 0)
      {
        v10 += v62;
        v23 = 1;
        v24 = 1;
      }
      else
      {
        v25 = CharacterAtIndex;
        if ((_DWORD)CharacterAtIndex == 65532)
        {
LABEL_12:
          v26 = 1;
          v27 = 1;
        }
        else
        {
          v28 = MEMORY[0x2348A8038](CharacterAtIndex);
          v29 = 0;
          v30 = 0;
          v18 = 0;
          v21 = 1;
          v26 = 1;
          v27 = 1;
          switch(v28)
          {
            case 0:
              goto LABEL_43;
            case 1:
            case 13:
              v29 = 0;
              v30 = 0;
              v21 = 2;
              goto LABEL_43;
            case 2:
            case 5:
              v29 = 0;
              v30 = 0;
              v21 = 3;
              goto LABEL_43;
            case 3:
              v29 = 0;
              v30 = 0;
              v21 = 5;
              goto LABEL_43;
            case 4:
              v29 = 0;
              v30 = 0;
              v21 = 6;
              goto LABEL_43;
            case 6:
              v29 = 0;
              v30 = 0;
              v21 = 4;
              goto LABEL_43;
            case 7:
              if (v25 == 8232)
                goto LABEL_24;
              goto LABEL_34;
            case 8:
              break;
            case 9:
              v18 = 0;
              LODWORD(v21) = 1;
              if (v25 > 132)
              {
                if (v25 != 133)
                {
                  if (v25 == 8232)
                  {
LABEL_24:
                    v18 = 1;
                    objc_msgSend(v55, "replaceCharactersInRange:withString:", v10, 1, CFSTR("\n"), v49);
LABEL_39:
                    LODWORD(v21) = 1;
                    goto LABEL_12;
                  }
                  if (v25 != 8233)
                    break;
                }
              }
              else if ((v25 - 10) >= 4)
              {
                break;
              }
LABEL_34:
              v18 = 1;
              if (v25 == 13 && v20 <= v49)
              {
                if (AMPCFStringGetCharacterAtIndex(buffer, v20, 0) == 10)
                {
                  ++v19;
                  ++v20;
                }
                v18 = 1;
                goto LABEL_39;
              }
              LODWORD(v21) = 1;
              break;
            case 10:
            case 18:
              v29 = 0;
              v30 = 0;
              v21 = 13;
              goto LABEL_43;
            case 11:
            case 12:
            case 14:
            case 15:
            case 16:
              v29 = 0;
              v30 = 0;
              v21 = 7;
              goto LABEL_43;
            case 17:
              v29 = 0;
              v30 = 0;
              v21 = 14;
              goto LABEL_43;
            case 19:
            case 20:
            case 21:
              v30 = v54 == 0;
              v29 = 1;
              v21 = 8;
              ++v54;
              goto LABEL_43;
            case 22:
              if (v54)
              {
                v30 = --v54 == 0;
              }
              else
              {
                v54 = 0;
                v30 = 0;
              }
              v29 = 1;
              v21 = 9;
              goto LABEL_43;
            default:
              v21 = 0;
              v29 = 0;
              v30 = 0;
LABEL_43:
              v14 += v19;
              if (v54 || v30)
              {
                v18 = 0;
                LODWORD(v21) = 0;
                v61 |= v15 != -1;
LABEL_48:
                v26 = v29;
              }
              else
              {
                v54 = 0;
                v18 = 0;
                v31 = v21;
                LODWORD(v21) = 0;
                v26 = v29;
                v27 = v29;
                switch(v31)
                {
                  case 0:
                  case 7:
                  case 13:
                  case 14:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v54 = 0;
                    goto LABEL_12;
                  case 1:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v54 = 0;
                    if (v15 == -1)
                      v15 = 0;
                    goto LABEL_12;
                  case 2:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v54 = 0;
                    if (v15 == -1)
                      v15 = 1;
                    goto LABEL_12;
                  case 3:
                    if (v60 != 0x7FFFFFFFFFFFFFFFLL)
                      goto LABEL_109;
                    if (v59 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v54 = 0;
                      v59 = 0x7FFFFFFFFFFFFFFFLL;
                      v60 = v10;
                      goto LABEL_48;
                    }
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v54 = 0;
                    v26 = 1;
                    v60 = v59;
                    break;
                  case 4:
                    v18 = 0;
                    LODWORD(v21) = 0;
                    v54 = 0;
                    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
                      v26 = 1;
                    else
                      v26 = v29;
                    break;
                  case 5:
                  case 6:
                    if (v60 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v54 = 0;
                      v48 = v59;
                      if (v59 == 0x7FFFFFFFFFFFFFFFLL)
                        v48 = v10;
                      v59 = v48;
                      v60 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    else
                    {
LABEL_109:
                      v18 = 0;
                      LODWORD(v21) = 0;
                      v54 = 0;
                    }
                    goto LABEL_48;
                  case 8:
                  case 9:
                  case 10:
                  case 11:
                  case 12:
                    goto LABEL_50;
                  default:
                    LODWORD(v21) = 0;
                    goto LABEL_48;
                }
              }
              v27 = v29;
              break;
          }
        }
LABEL_50:
        v24 = v21;
        LOBYTE(v21) = v26 != 0;
        v23 = v27 != 0;
        v10 = v20;
      }
      v13 += v19;
      v32 = v58;
      if (v10 == v58)
      {
        v18 = 1;
        v60 = 0x7FFFFFFFFFFFFFFFLL;
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v16 = v59;
        if ((v21 & (v59 != 0x7FFFFFFFFFFFFFFFLL)) != 0)
          v16 = 0x7FFFFFFFFFFFFFFFLL;
        v33 = v60;
        if (v23 && v60 != 0x7FFFFFFFFFFFFFFFLL)
          v33 = 0x7FFFFFFFFFFFFFFFLL;
        v60 = v33;
        if (!v24)
          goto LABEL_94;
      }
      if (v15)
        v34 = v12;
      else
        v34 = v12 + 1;
      if (v15 == 1)
        ++v11;
      else
        v12 = v34;
      if (((v14 != 0) & v61) == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v87[0] = v35;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addAttribute:value:range:", v52, v36, v57, v14);

      }
      if (v18)
        break;
      v14 = 0;
      v61 = 0;
      v15 = -1;
      v57 = v10;
LABEL_94:
      if (v10 == v32)
      {
        v4 = v53;
        v5 = v50;
        goto LABEL_115;
      }
    }
    if (v11 && (double)v11 / (double)(v11 + v12) >= 0.4)
    {
      if (defaultParagraphStyle_sOnceForRightToLeft != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForRightToLeft, &__block_literal_global_14);
      v39 = 1;
      v40 = &defaultParagraphStyle_defaultRTLParagraphStyleAttribute;
      v37 = v53;
      v38 = v56;
    }
    else if (v12 | v11)
    {
      v37 = v53;
      v38 = v56;
      if (defaultParagraphStyle_sOnceForLeftToRight != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForLeftToRight, &__block_literal_global_2);
      v39 = 0;
      v40 = &defaultParagraphStyle_defaultLTRParagraphStyleAttribute;
    }
    else
    {
      v37 = v53;
      v38 = v56;
      if (defaultParagraphStyle_sOnceForNatural != -1)
        dispatch_once(&defaultParagraphStyle_sOnceForNatural, &__block_literal_global_13);
      v39 = -1;
      v40 = &defaultParagraphStyle_defaultNaturalParagraphStyleAttribute;
    }
    v41 = (id)*v40;
    if (v37)
    {
      v42 = v16;
      objc_msgSend(v37, "tv_paragraphStyleWithBaseWritingDirection:", v39);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = 1;
LABEL_91:

      if (v44)
        objc_msgSend(v55, "addAttribute:value:range:", v51, v43, v38, v13);

      v14 = 0;
      v61 = 0;
      v13 = 0;
      v12 = 0;
      v11 = 0;
      v15 = -1;
      v56 = v10;
      v57 = v10;
      v32 = v58;
      v16 = v42;
      goto LABEL_94;
    }
    v86.location = 0;
    v86.length = 0;
    objc_msgSend(v55, "attribute:atIndex:effectiveRange:", v51, v38, &v86);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v16;
    if (v45)
    {
      v88.location = v38;
      v88.length = v13;
      v46 = NSIntersectionRange(v86, v88);
      if (v46.location == v38 && v46.length == v13 && objc_msgSend(v45, "baseWritingDirection") == v39)
      {
        v43 = v45;
        v44 = 0;
LABEL_90:

        goto LABEL_91;
      }
      objc_msgSend(v45, "tv_paragraphStyleWithBaseWritingDirection:", v39, v49);
      v47 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = v41;
    }
    v43 = v47;
    v44 = 1;
    goto LABEL_90;
  }
LABEL_115:

}

@end
