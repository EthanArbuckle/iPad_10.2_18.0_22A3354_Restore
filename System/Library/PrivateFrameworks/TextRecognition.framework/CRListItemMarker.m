@implementation CRListItemMarker

- (CRListItemMarker)initWithType:(int64_t)a3 stringValue:(id)a4 range:(_NSRange)a5 itemizingComponentRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  id v13;
  CRListItemMarker *v14;
  CRListItemMarker *v15;

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  v13 = a4;
  v14 = -[CRListItemMarker init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_stringValue, a4);
    v15->_range.length = v8;
    v15->_itemizingComponentRange.location = location;
    v15->_itemizingComponentRange.length = length;
    v15->_type = a3;
    v15->_range.location = v9;
  }

  return v15;
}

- (BOOL)canBeSucceededByMarker:(id)a3
{
  id v4;
  void *v5;
  int64_t type;
  BOOL v7;
  int64_t v8;
  uint64_t v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  type = self->_type;
  if (!type)
  {
    if (!objc_msgSend(v4, "type"))
    {
LABEL_7:
      v7 = 1;
      goto LABEL_19;
    }
    type = self->_type;
  }
  if ((unint64_t)(type - 1) <= 1)
  {
    if (objc_msgSend(v5, "type") == 1 || objc_msgSend(v5, "type") == 2)
      goto LABEL_7;
    type = self->_type;
  }
  if (type == objc_msgSend(v5, "type"))
  {
    if (self->_type == 7 && objc_msgSend(v5, "type") == 7)
    {
      v7 = -[CRListItemMarker _canCompositeDecimalBeSucceededByCompositeDecimal:](self, "_canCompositeDecimalBeSucceededByCompositeDecimal:", v5);
    }
    else
    {
      v8 = -[CRListItemMarker integerValue](self, "integerValue");
      v9 = objc_msgSend(v5, "integerValue");
      v10 = v9 == v8 + 1;
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        v10 = 0;
      v7 = v8 != 0x7FFFFFFFFFFFFFFFLL && v10;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_19:

  return v7;
}

- (int64_t)integerValue
{
  int64_t result;

  switch(self->_type)
  {
    case 3:
      result = -[CRListItemMarker _valueFromLowercaseLatin](self, "_valueFromLowercaseLatin");
      break;
    case 4:
      result = -[CRListItemMarker _valueFromUppercaseLatin](self, "_valueFromUppercaseLatin");
      break;
    case 5:
      result = -[CRListItemMarker _valueFromDecimal](self, "_valueFromDecimal");
      break;
    case 6:
      result = -[CRListItemMarker _valueFromDecorativeDecimal](self, "_valueFromDecorativeDecimal");
      break;
    default:
      result = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return result;
}

+ (id)listItemMarkerForText:(id)a3 requiresAdjacentText:(BOOL)a4
{
  id v6;
  void *v7;
  CRListItemMarker *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unint64_t v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  CRListItemMarker *v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  int v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  unint64_t v87;
  char v88;
  int v90;
  void *v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  CRListItemMarker *v95;
  void *v96;
  int v97;
  unint64_t v98;
  BOOL v99;
  uint64_t v100;
  void *v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  int v108;
  unint64_t v109;
  void *v110;
  uint64_t v111;
  int v112;
  unint64_t v113;
  unint64_t v114;
  int v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "bulletsSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detectPredefinedListMarker:fromSet:markerType:", v6, v7, 1);
  v8 = (CRListItemMarker *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_131;
  objc_msgSend(a1, "hyphensSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detectPredefinedListMarker:fromSet:markerType:", v6, v9, 2);
  v8 = (CRListItemMarker *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_131;
  objc_msgSend(a1, "decorativeDecimalsSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detectPredefinedListMarker:fromSet:markerType:", v6, v10, 6);
  v8 = (CRListItemMarker *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_131;
  objc_msgSend(a1, "extendedMarkersSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detectPredefinedListMarker:fromSet:markerType:", v6, v11, 0);
  v8 = (CRListItemMarker *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_131;
  v99 = a4;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObject:", &stru_1E98DC948);
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length"))
  {
    v115 = 0;
    v112 = 0;
    goto LABEL_49;
  }
  v101 = v14;
  v16 = 0;
  v107 = 0;
  v111 = 0;
  v112 = 0;
  v115 = 0;
  v17 = 0x8000000000000001;
  v18 = 1;
  v19 = 1;
  v104 = 1;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v21 = objc_msgSend(v15, "characterAtIndex:", v18 - 1);
    v22 = v112;
    if ((v21 - 58) >= 0xFFFFFFF6 && (v112 & 1) == 0)
    {
      if (v19 + 1 == v104)
        v23 = v19 + 1;
      else
        v23 = v19;
      v24 = v111;
      if (v23 > 1)
        v24 = 7;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v24 = 5;
      v111 = v24;
      v25 = v115;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v25 = 1;
      v115 = v25;
      v112 = 0;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v26 = v18 - 1;
      else
        v26 = v20;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v27 = 1;
      else
        v27 = v16 + v17 + 1;
      v107 = v27;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        v19 = v23;
      goto LABEL_43;
    }
    if (!(((v21 - 1642) < 0xFFFFFFF6) | v115 & 1))
    {
      v28 = v17 + v18;
      v29 = v111;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v29 = 5;
      v111 = v29;
      v115 = 0;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v22 = 1;
      v112 = v22;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v26 = v18 - 1;
      else
        v26 = v20;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v28 = 1;
      v107 = v28;
      goto LABEL_43;
    }
    if (v21 != 46 || (v115 & 1) == 0)
      break;
    ++v104;
    v115 = 1;
    v26 = v20;
LABEL_43:
    ++v16;
    v20 = v26;
    v17 = -(uint64_t)v26;
    if (v18++ >= objc_msgSend(v15, "length"))
      goto LABEL_45;
  }
  if (v18 - 1 <= 2 && ((v115 | v112) & 1) == 0)
  {
    v26 = v20;
    v115 = 0;
    v112 = 0;
    goto LABEL_43;
  }
LABEL_45:
  if (v19 > 3)
  {
    v8 = 0;
    v14 = v101;
    goto LABEL_130;
  }
  v14 = v101;
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = v20;
    v36 = 0;
    v34 = v107;
    goto LABEL_56;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v15, "rangeOfCharacterFromSet:", v31);
  v34 = v33;

  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_129;
  v35 = objc_msgSend(v15, "characterAtIndex:", v32);
  if ((v35 - 65) < 0x1A)
  {
    v36 = 1;
    v37 = 4;
    goto LABEL_55;
  }
  if ((v35 - 97) > 0x19)
  {
LABEL_129:
    v8 = 0;
    goto LABEL_130;
  }
  v36 = 1;
  v37 = 3;
LABEL_55:
  v111 = v37;
LABEL_56:
  if (v32)
  {
    v38 = 0;
    do
    {
      v39 = objc_msgSend(v15, "characterAtIndex:", v38);
      objc_msgSend(a1, "startOfMarkerSet");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = objc_msgSend(v40, "characterIsMember:", v39);

      if ((v39 & 1) == 0)
        goto LABEL_129;
    }
    while (v32 != ++v38);
  }
  v41 = v34 + v32;
  if (v34 + v32 >= objc_msgSend(v15, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") < 2)
    {
      v51 = 0;
      v49 = 0;
      v50 = 1;
      goto LABEL_76;
    }
    v108 = v36;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "characterAtIndex:", 0);

    objc_msgSend(a1, "endOfMarkerSet");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v53) = objc_msgSend(v54, "characterIsMember:", v53);

    if ((_DWORD)v53)
    {
      v41 = v34 + v32 + 2;
      v51 = 1;
      v50 = 2;
      v49 = 1;
    }
    else
    {
      v51 = 0;
      v49 = 0;
      v41 = v34 + v32;
      v50 = 1;
    }
LABEL_75:
    v36 = v108;
    goto LABEL_76;
  }
  v108 = v36;
  v42 = v34 + v32;
  v43 = objc_msgSend(v15, "characterAtIndex:", v34 + v32);
  objc_msgSend(a1, "endOfMarkerSet");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "characterIsMember:", v43);

  if (!v45)
  {
    v51 = 0;
    v49 = 0;
    v50 = 1;
    v41 = v34 + v32;
    goto LABEL_75;
  }
  objc_msgSend(a1, "nonMarkerNumericConstructSeparatorSet");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v46, "characterIsMember:", v43))
  {

    v49 = 0;
    v41 = v42 + 1;
LABEL_74:
    v50 = 1;
    v51 = 1;
    goto LABEL_75;
  }
  v41 = v42 + 1;
  v47 = objc_msgSend(v15, "length");

  if (v42 + 1 >= v47)
  {
    v49 = 0;
    goto LABEL_74;
  }
  v48 = objc_msgSend(v15, "characterAtIndex:", v42 + 1);
  v8 = 0;
  v36 = v108;
  if ((v48 - 58) >= 0xFFFFFFF6)
    goto LABEL_130;
  v49 = 0;
  v50 = 1;
  v51 = 1;
LABEL_76:
  if (!v99 && ((v36 | v115 | v112) & v51) == 1)
  {
    v55 = [CRListItemMarker alloc];
    objc_msgSend(v6, "substringWithRange:", 0, v41);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v41;
    v58 = (void *)v56;
    v8 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v55, "initWithType:stringValue:range:itemizingComponentRange:", v111, v56, 0, v57, v32, v34);

    goto LABEL_130;
  }
  v59 = objc_msgSend(v15, "length");
  if (v41 < objc_msgSend(v15, "length"))
  {
    v109 = v34;
    v113 = v50;
    objc_msgSend(v14, "objectAtIndexedSubscript:", v50 - 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "characterAtIndex:", v41);

    if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x6000502BB00060, (uint16x4_t)vadd_s16(vdup_n_s16(v61), (int16x4_t)0xCFC028505400CED0))) & 1) == 0&& (unsigned __int16)(v61 - 12448) >= 0x60u&& (v61 & 0xFF00) != 0x1100&& (v61 & 0xFFE0) != 0xA960&& (unsigned __int16)((unsigned __int16)(v61 - 19968) >> 9) >= 0x29u&& (unsigned __int16)((unsigned __int16)(v61 - 13312) >> 6) >= 0x67u)
    {
      v105 = v59;
      goto LABEL_87;
    }
LABEL_96:
    v70 = v109;
    if (v109 >= 7 && v111 != 7)
      goto LABEL_129;
    v71 = v113 - 1;
    if (v113 - 1 >= objc_msgSend(v14, "count"))
      goto LABEL_129;
    v100 = v32;
    v72 = 0;
    v73 = 0;
    while (1)
    {
      if (v72)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v71 + v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "length");
      }
      else
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "length") - v41;
      }

      v73 += v75;
      if (v73 > 2)
        goto LABEL_136;
      v8 = 0;
      ++v72;
      if (v71 + v72 >= objc_msgSend(v14, "count"))
        goto LABEL_130;
    }
  }
  if (objc_msgSend(v14, "count") <= v50)
  {
    v64 = 0;
  }
  else
  {
    v102 = v51;
    v105 = v59;
    v65 = v41;
    objc_msgSend(v14, "objectAtIndexedSubscript:", v50);
    v66 = v50;
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "length");

    if (v68 < 2)
    {
      v64 = 0;
      v41 = v65;
      v51 = v102;
      v50 = v66;
    }
    else
    {
      v109 = v34;
      v113 = v66;
      objc_msgSend(v14, "objectAtIndexedSubscript:", v66);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v69, "characterAtIndex:", v49);

      v41 = v65;
      v51 = v102;
      if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x6000502BB00060, (uint16x4_t)vadd_s16(vdup_n_s16(v61), (int16x4_t)0xCFC028505400CED0))) & 1) != 0|| (unsigned __int16)(v61 - 12448) < 0x60u|| (v61 & 0xFF00) == 0x1100|| (v61 & 0xFFE0) == 0xA960|| (unsigned __int16)((unsigned __int16)(v61 - 19968) >> 9) < 0x29u|| (unsigned __int16)((unsigned __int16)(v61 - 13312) >> 6) < 0x67u)
      {
        goto LABEL_96;
      }
LABEL_87:
      objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "characterIsMember:", v61);

      v34 = v109;
      v50 = v113;
      v64 = v63;
    }
    v59 = v105;
  }
  if ((unint64_t)objc_msgSend(v14, "count") < 2
    || v34 >= 7 && v111 != 7
    || (unint64_t)objc_msgSend(v14, "count") < 2)
  {
    goto LABEL_129;
  }
  v97 = v64;
  v103 = v51;
  v106 = v59;
  v114 = v50;
  v98 = v41;
  v100 = v32;
  v70 = v34;
  v110 = v15;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v76 = v14;
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v116, v120, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v117;
LABEL_115:
    v80 = 0;
    while (1)
    {
      if (*(_QWORD *)v117 != v79)
        objc_enumerationMutation(v76);
      v81 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v80);
      objc_msgSend(v76, "firstObject");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81 != v82)
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v81, "_crContainsCharactersInSet:", v83);

        if ((v84 & 1) != 0)
          break;
      }
      if (v78 == ++v80)
      {
        v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v116, v120, 16);
        if (v78)
          goto LABEL_115;
        goto LABEL_122;
      }
    }

    objc_msgSend(v76, "objectAtIndexedSubscript:", v114 - 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v85, "length") < 3)
    {

      v15 = v110;
      v41 = v98;
      if ((v115 & 1) == 0)
      {
        if (!v103)
          goto LABEL_129;
        goto LABEL_136;
      }
    }
    else
    {
      objc_msgSend(v76, "objectAtIndexedSubscript:", v114 - 1);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v86, "length");

      v15 = v110;
      v41 = v98;
      if ((v115 & 1) == 0)
      {
        if (v87 < 4)
          v88 = v103;
        else
          v88 = 0;
        if ((v88 & 1) != 0)
          goto LABEL_136;
        goto LABEL_129;
      }
    }
    v90 = v97;
    if (v41 != v106)
      v90 = 0;
    if (((v103 | v90) & 1) == 0)
      goto LABEL_129;
LABEL_136:
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v41;
    v93 = objc_msgSend(v6, "_crCountConsecutiveCharactersAtIndex:fromSet:", v41, v91);

    v94 = v93 + v92;
    v95 = [CRListItemMarker alloc];
    objc_msgSend(v6, "substringWithRange:", 0, v92);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v95, "initWithType:stringValue:range:itemizingComponentRange:", v111, v96, 0, v94, v100, v70);

  }
  else
  {
LABEL_122:

    v8 = 0;
    v15 = v110;
  }
LABEL_130:

LABEL_131:
  return v8;
}

+ (id)_detectPredefinedListMarker:(id)a3 fromSet:(id)a4 markerType:(int64_t)a5
{
  id v7;
  uint64_t v8;
  CRListItemMarker *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CRListItemMarker *v14;
  void *v15;

  v7 = a3;
  if (objc_msgSend(v7, "rangeOfCharacterFromSet:", a4))
  {
    v9 = 0;
  }
  else
  {
    v10 = v8;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "_crCountConsecutiveCharactersAtIndex:fromSet:", v10, v11);

    if (a5 == 6)
      v13 = 0;
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = [CRListItemMarker alloc];
    objc_msgSend(v7, "substringWithRange:", 0, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CRListItemMarker initWithType:stringValue:range:itemizingComponentRange:](v14, "initWithType:stringValue:range:itemizingComponentRange:", a5, v15, 0, v12 + v10, v13, a5 == 6);

  }
  return v9;
}

+ (id)decorativeDecimalsSet
{
  if (qword_1ED0B47D0 != -1)
    dispatch_once(&qword_1ED0B47D0, &__block_literal_global_32);
  return (id)_MergedGlobals_31;
}

void __41__CRListItemMarker_decorativeDecimalsSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳❶❷❸❹❺❻❼❽❾❿➀➁➂➃➄➅➆➇➈➉➊➋➌➍➎➏➐➑➒➓"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v0;

}

+ (id)bulletsSet
{
  if (qword_1ED0B47E0 != -1)
    dispatch_once(&qword_1ED0B47E0, &__block_literal_global_5);
  return (id)qword_1ED0B47D8;
}

void __30__CRListItemMarker_bulletsSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("●∙•◦°⋅〇◎·・。※"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B47D8;
  qword_1ED0B47D8 = v0;

}

+ (id)hyphensSet
{
  if (qword_1ED0B47F0 != -1)
    dispatch_once(&qword_1ED0B47F0, &__block_literal_global_8);
  return (id)qword_1ED0B47E8;
}

void __30__CRListItemMarker_hyphensSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-–－—"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B47E8;
  qword_1ED0B47E8 = v0;

}

+ (id)extendedMarkersSet
{
  if (qword_1ED0B4800 != -1)
    dispatch_once(&qword_1ED0B4800, &__block_literal_global_11);
  return (id)qword_1ED0B47F8;
}

void __38__CRListItemMarker_extendedMarkersSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*»›>▶"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B47F8;
  qword_1ED0B47F8 = v0;

}

+ (id)startOfMarkerSet
{
  if (qword_1ED0B4810 != -1)
    dispatch_once(&qword_1ED0B4810, &__block_literal_global_14);
  return (id)qword_1ED0B4808;
}

void __36__CRListItemMarker_startOfMarkerSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("#(["));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4808;
  qword_1ED0B4808 = v0;

}

+ (id)endOfMarkerSet
{
  if (qword_1ED0B4820 != -1)
    dispatch_once(&qword_1ED0B4820, &__block_literal_global_17);
  return (id)qword_1ED0B4818;
}

void __34__CRListItemMarker_endOfMarkerSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".):;]|．。-、"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4818;
  qword_1ED0B4818 = v0;

}

+ (id)nonMarkerNumericConstructSeparatorSet
{
  if (qword_1ED0B4830 != -1)
    dispatch_once(&qword_1ED0B4830, &__block_literal_global_20_1);
  return (id)qword_1ED0B4828;
}

void __57__CRListItemMarker_nonMarkerNumericConstructSeparatorSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(":;-~〜～"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B4828;
  qword_1ED0B4828 = v0;

}

- (BOOL)_canCompositeDecimalBeSucceededByCompositeDecimal:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  char v16;
  char v17;

  v4 = a3;
  -[CRListItemMarker _valuesFromCompositeDecimal](self, "_valuesFromCompositeDecimal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_valuesFromCompositeDecimal");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_18;
  v9 = objc_msgSend(v5, "count");
  if (v9 != objc_msgSend(v7, "count") || !objc_msgSend(v5, "count"))
  {
    v8 = 0;
    goto LABEL_18;
  }
  v10 = 0;
  v11 = 0;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v15 != v13 + 1)
    {
      if ((v11 & 1) != 0)
      {
        v11 = 1;
        if (v15 > 1)
        {
          v17 = 0;
          v16 = 1;
          goto LABEL_17;
        }
      }
      else
      {
        v11 = 0;
        v16 = 0;
        v17 = 0;
        if (v15 != v13)
          goto LABEL_17;
      }
      goto LABEL_13;
    }
    v16 = 1;
    if ((v11 & 1) != 0)
      break;
    v11 = 1;
LABEL_13:
    if (++v10 >= (unint64_t)objc_msgSend(v5, "count"))
    {
      v17 = 1;
      v16 = v11;
      goto LABEL_17;
    }
  }
  v17 = 0;
LABEL_17:
  v8 = v16 & v17;
LABEL_18:

  return v8;
}

- (id)_valuesFromCompositeDecimal
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_type == 7)
  {
    -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", self->_itemizingComponentRange.location, self->_itemizingComponentRange.length);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (_QWORD)v14))
          {
            v11 = objc_msgSend(v10, "integerValue");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)_valueFromDecorativeDecimal
{
  int64_t type;
  int64_t result;
  NSUInteger location;
  void *v6;
  int v7;
  int v8;

  type = self->_type;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (type == 6)
  {
    location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "characterAtIndex:", 0);

      if ((v7 - 9312) > 0x13)
      {
        if ((v7 - 10102) > 9)
        {
          if ((v7 - 10112) > 9)
          {
            if ((v7 - 10122) > 9)
              return 0x7FFFFFFFFFFFFFFFLL;
            v8 = -10121;
          }
          else
          {
            v8 = -10111;
          }
        }
        else
        {
          v8 = -10101;
        }
      }
      else
      {
        v8 = -9311;
      }
      return (v7 + v8);
    }
  }
  return result;
}

- (int64_t)_valueFromDecimal
{
  NSUInteger location;
  void *v4;
  int64_t v5;

  if (self->_type != 5)
    return 0x7FFFFFFFFFFFFFFFLL;
  location = self->_itemizingComponentRange.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (int64_t)_valueFromLowercaseLatin
{
  int64_t v2;
  NSUInteger location;
  void *v4;
  unsigned int v5;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_type == 3)
  {
    location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "characterAtIndex:", 0);

      return v5 - 97;
    }
  }
  return v2;
}

- (int64_t)_valueFromUppercaseLatin
{
  int64_t v2;
  NSUInteger location;
  void *v4;
  unsigned int v5;

  v2 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_type == 4)
  {
    location = self->_itemizingComponentRange.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSString substringWithRange:](self->_stringValue, "substringWithRange:", location, self->_itemizingComponentRange.length);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "characterAtIndex:", 0);

      return v5 - 65;
    }
  }
  return v2;
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (_NSRange)itemizingComponentRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_itemizingComponentRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setItemizingComponentRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_itemizingComponentRange, &v3, 16, 1, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
