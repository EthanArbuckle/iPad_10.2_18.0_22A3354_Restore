@implementation TTSSpeechString

- (TTSSpeechString)initWithParentSpeechString:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TTSSpeechString *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *originalString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *transformations;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TTSSpeechString;
  v10 = -[TTSSpeechString init](&v29, sel_init);
  if (v10)
  {
    objc_msgSend_transformedString(v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_copy(v11, v12, v13, v14, v15);
    originalString = v10->_originalString;
    v10->_originalString = (NSString *)v16;

    objc_storeStrong((id *)&v10->_parentString, a3);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    transformations = v10->_transformations;
    v10->_transformations = (NSMutableArray *)v22;

    v10->_type = objc_msgSend_type(v5, v24, v25, v26, v27);
  }

  return v10;
}

- (TTSSpeechString)initWithOriginalString:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TTSSpeechString *v9;
  uint64_t v10;
  NSString *originalString;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *transformations;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TTSSpeechString;
  v9 = -[TTSSpeechString init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    originalString = v9->_originalString;
    v9->_originalString = (NSString *)v10;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    transformations = v9->_transformations;
    v9->_transformations = (NSMutableArray *)v16;

    v9->_type = 0;
  }

  return v9;
}

- (TTSSpeechString)initWithSSMLString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  TTSSpeechString *result;

  result = (TTSSpeechString *)objc_msgSend_initWithOriginalString_(self, a2, (uint64_t)a3, v3, v4);
  result->_type = 1;
  return result;
}

- (BOOL)finalized
{
  return self->_transformedString != 0;
}

- (void)replaceOccurencesOfString:(id)a3 withString:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  const char *v32;
  id v33;
  _QWORD v34[5];
  id v35;

  v6 = a4;
  v7 = a3;
  objc_msgSend_sharedInstance(TTSRegexCache, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_regexForString_(v12, v13, (uint64_t)v7, v14, v15);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_originalString(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalString(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_length(v25, v26, v27, v28, v29);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1A3994038;
  v34[3] = &unk_1E4AA03D0;
  v34[4] = self;
  v35 = v6;
  v31 = v6;
  objc_msgSend_enumerateMatchesInString_options_range_usingBlock_(v33, v32, (uint64_t)v20, 2, 0, v30, v34);

}

- (BOOL)transformRange:(_NSRange)a3 to:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSUInteger v24;
  TTSStringTransformation *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  BOOL v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  NSRange v37;
  NSRange v38;

  length = a3.length;
  location = a3.location;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend__rangeIsValid_(self, v8, location, length, v9))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend_transformations(self, v10, v11, v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v16)
    {
      v21 = v16;
      v22 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v14);
          v38.location = objc_msgSend_range(*(void **)(*((_QWORD *)&v31 + 1) + 8 * i), v17, v18, v19, v20);
          v38.length = v24;
          v37.location = location;
          v37.length = length;
          v17 = (const char *)NSIntersectionRange(v37, v38).length;
          if (v17)
          {
            v29 = 0;
            goto LABEL_13;
          }
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, 0, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v21)
          continue;
        break;
      }
    }

    v25 = [TTSStringTransformation alloc];
    v14 = (void *)objc_msgSend_initWithRange_andReplacement_(v25, v26, location, length, (uint64_t)v7);
    objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v27, (uint64_t)v14, 0, v28);
    v29 = 1;
LABEL_13:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)insertAtLocation:(unint64_t)a3 string:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  TTSStringTransformation *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;

  v6 = a4;
  objc_msgSend_originalString(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v11, v12, v13, v14, v15);

  if (v16 >= a3)
  {
    v17 = [TTSStringTransformation alloc];
    v19 = (void *)objc_msgSend_initWithRange_andReplacement_(v17, v18, a3, 0, (uint64_t)v6);
    objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v20, (uint64_t)v19, 0, v21);

  }
  return v16 >= a3;
}

- (BOOL)encapsulateSubstringAtRange:(_NSRange)a3 withPrefix:(id)a4 andSuffix:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int IsValid;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  TTSStringTransformation *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  IsValid = objc_msgSend__rangeIsValid_(self, v11, location, length, v12);
  if (IsValid)
  {
    if (objc_msgSend_length(v9, v13, v14, v15, v16))
      objc_msgSend_insertAtLocation_string_(self, v18, location, (uint64_t)v9, v21);
    if (objc_msgSend_length(v10, v18, v19, v20, v21))
    {
      v22 = [TTSStringTransformation alloc];
      v24 = (void *)objc_msgSend_initWithRange_andReplacement_(v22, v23, location + length, 0, (uint64_t)v10);
      objc_msgSend__insertTransformation_forEncapsulatedTerminator_(self, v25, (uint64_t)v24, 1, v26);

    }
  }

  return IsValid;
}

- (_NSRange)translateRangeInTransformedString:(_NSRange)a3
{
  uint64_t v3;
  NSUInteger length;
  NSUInteger location;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  objc_msgSend_parentString(self, a2, a3.location, a3.length, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v8, location, length, (uint64_t)v7);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)_translateRangeInTransformedString:(_NSRange)a3 withParent:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSUInteger v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSRange v33;
  unint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  const char *v45;
  uint64_t v46;
  NSUInteger v47;
  NSUInteger v48;
  NSRange v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSUInteger v83;
  void *v84;
  const char *v85;
  NSUInteger v86;
  NSUInteger v87;
  NSUInteger v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  NSUInteger v95;
  NSUInteger v96;
  NSUInteger v97;
  NSRange v98;
  NSUInteger v99;
  NSUInteger v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  uint64_t v109;
  NSRange v110;
  NSRange v111;
  NSRange v112;
  _NSRange result;
  NSRange v114;
  NSRange v115;
  NSRange v116;

  length = a3.length;
  location = a3.location;
  v109 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend_transformations(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reverseObjectEnumerator(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v104, (uint64_t)v108, 16);
  if (v19)
  {
    v24 = v19;
    v25 = 0;
    v26 = *(_QWORD *)v105;
    v103 = v7;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v105 != v26)
          objc_enumerationMutation(v17);
        v28 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        v114.location = objc_msgSend_finalRange(v28, v20, v21, v22, v23);
        v114.length = v29;
        v110.location = location;
        v110.length = length;
        v33 = NSIntersectionRange(v110, v114);
        if (v33.length == length)
        {
          v42 = objc_msgSend_range(v28, (const char *)v33.length, v30, v31, v32);
          length = (NSUInteger)v40;
          v7 = v103;
          if (v103)
          {
            v43 = objc_msgSend_translateRangeInTransformedString_(v103, v40, v42, (uint64_t)v40, v41);
            goto LABEL_25;
          }
LABEL_26:

          goto LABEL_27;
        }
        v34 = objc_msgSend_finalRange(v28, (const char *)v33.length, v30, v31, v32);
        if (v33.length)
          v39 = 1;
        else
          v39 = location >= v34;
        if (!v39)
        {
          v7 = v103;
          goto LABEL_19;
        }
        if (v33.length)
        {
          v115.location = objc_msgSend_finalRange(v28, v35, v36, v37, v38);
          v115.length = v48;
          v111.location = location;
          v111.length = length;
          v49 = NSUnionRange(v111, v115);
          v53 = objc_msgSend_finalRange(v28, (const char *)v49.length, v50, v51, v52);
          objc_msgSend_finalRange(v28, v54, v55, v56, v57);
          v59 = v58;
          v63 = objc_msgSend_finalRange(v28, v58, v60, v61, v62);
          objc_msgSend_finalRange(v28, v64, v65, v66, v67);
          v69 = v68;
          v73 = objc_msgSend_finalRange(v28, v68, v70, v71, v72);
          v101 = (uint64_t)v74;
          v102 = v73;
          if (v49.location >= objc_msgSend_finalRange(v28, v74, v75, v76, v77))
          {
            v83 = (NSUInteger)&v59[v53];
            v82 = v49.location + v49.length - (_QWORD)&v69[v63];
          }
          else
          {
            v82 = objc_msgSend_finalRange(v28, v78, v79, v80, v81) - v49.location;
            v83 = v49.location;
          }
          v7 = v103;
          objc_msgSend_parentString(self, v78, v79, v80, v81);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v85, v83, v82, (uint64_t)v84);
          v88 = v87;

          objc_msgSend_parentString(self, v89, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend__translateRangeInTransformedString_withParent_(self, v94, v102, v101, (uint64_t)v93);
          v97 = v96;

          v112.location = v95;
          v112.length = v97;
          v116.location = v86;
          v116.length = v88;
          v98 = NSUnionRange(v112, v116);
          v44 = v98.length;
          v43 = v98.location;
LABEL_25:
          v42 = v43;
          length = v44;
          goto LABEL_26;
        }
        v25 += objc_msgSend_sizeDelta(v28, v35, v36, v37, v38);
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v104, (uint64_t)v108, 16);
      v7 = v103;
      if (v24)
        continue;
      break;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_19:

  v42 = location - v25;
  if (v7)
  {
    v42 = objc_msgSend_translateRangeInTransformedString_(v7, v45, location - v25, length, v46);
    length = v47;
  }
LABEL_27:

  v99 = v42;
  v100 = length;
  result.length = v100;
  result.location = v99;
  return result;
}

- (NSString)defrostedTransformedString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *transformedString;

  transformedString = self->_transformedString;
  if (transformedString)
    return transformedString;
  objc_msgSend__transformedStringNonMutating(self, a2, v2, v3, v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_transformedStringNonMutating
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend_originalString(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend_transformations(self, v12, v13, v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v18)
  {
    v23 = v18;
    v24 = *(_QWORD *)v38;
    do
    {
      v25 = 0;
      v26 = v11;
      do
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v16);
        v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v25);
        v28 = objc_msgSend_range(v27, v19, v20, v21, v22);
        v30 = (uint64_t)v29;
        objc_msgSend_replacement(v27, v29, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingCharactersInRange_withString_(v26, v35, v28, v30, (uint64_t)v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v25;
        v26 = v11;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v23);
  }

  return v11;
}

- (NSString)transformedString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *transformedString;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  NSString *v109;
  id v110;
  NSString *v111;
  id obj;
  TTSSpeechString *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  transformedString = self->_transformedString;
  if (transformedString)
    return transformedString;
  objc_msgSend_originalString(self, a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v8, v9, v10, v11, v12);

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v113 = self;
  objc_msgSend_transformations(self, v14, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v118, (uint64_t)v123, 16);
  if (v19)
  {
    v24 = v19;
    v25 = 0;
    v26 = *(_QWORD *)v119;
    do
    {
      v27 = 0;
      v28 = v13;
      do
      {
        if (*(_QWORD *)v119 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v27);
        v30 = objc_msgSend_range(v29, v20, v21, v22, v23);
        v32 = (uint64_t)v31;
        objc_msgSend_replacement(v29, v31, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingCharactersInRange_withString_(v28, v37, v30, v32, (uint64_t)v36);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_originalString(v113, v38, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend_length(v42, v43, v44, v45, v46);
        v52 = objc_msgSend_range(v29, v48, v49, v50, v51);
        objc_msgSend_range(v29, v53, v54, v55, v56);
        v58 = v57;

        objc_msgSend_setOffsetFromEnd_(v29, v59, v47 + v25 - (v52 + v58), v60, v61);
        v25 += objc_msgSend_sizeDelta(v29, v62, v63, v64, v65);
        ++v27;
        v28 = v13;
      }
      while (v24 != v27);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v118, (uint64_t)v123, 16);
    }
    while (v24);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend_transformations(v113, v66, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v114, (uint64_t)v122, 16);
  if (v72)
  {
    v77 = v72;
    v78 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v115 != v78)
          objc_enumerationMutation(v70);
        v80 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
        v81 = objc_msgSend_length(v13, v73, v74, v75, v76);
        v86 = objc_msgSend_offsetFromEnd(v80, v82, v83, v84, v85);
        objc_msgSend_replacement(v80, v87, v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v81 - v86 - objc_msgSend_length(v91, v92, v93, v94, v95);
        objc_msgSend_replacement(v80, v97, v98, v99, v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = objc_msgSend_length(v101, v102, v103, v104, v105);
        objc_msgSend_setFinalRange_(v80, v107, v96, v106, v108);

      }
      v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v114, (uint64_t)v122, 16);
    }
    while (v77);
  }

  v109 = v113->_transformedString;
  v113->_transformedString = (NSString *)v13;
  v110 = v13;

  v111 = v113->_transformedString;
  return v111;
}

- (BOOL)_rangeIsValid:(_NSRange)a3
{
  uint64_t v3;
  BOOL v4;
  NSUInteger length;
  NSUInteger location;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSRange v13;
  NSRange v14;

  if (self->_transformedString)
    return 0;
  length = a3.length;
  location = a3.location;
  objc_msgSend_originalString(self, a2, a3.location, a3.length, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.length = objc_msgSend_length(v7, v8, v9, v10, v11);
  v13.location = location;
  v13.length = length;
  v14.location = 0;
  v4 = NSIntersectionRange(v13, v14).length == length;

  return v4;
}

- (void)_insertTransformation:(id)a3 forEncapsulatedTerminator:(BOOL)a4
{
  id *v4;
  _BOOL4 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  BOOL (*v43)(uint64_t, void *);
  void *v44;
  id v45;

  v5 = a4;
  v40 = a3;
  if (!v5)
    goto LABEL_3;
  objc_msgSend_transformations(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = MEMORY[0x1E0C809B0];
  v42 = 3221225472;
  v43 = sub_1A3994CE8;
  v44 = &unk_1E4AA1710;
  v4 = &v45;
  v12 = v40;
  v45 = v12;
  v16 = objc_msgSend_indexOfObjectPassingTest_(v11, v13, (uint64_t)&v41, v14, v15);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_transformations(self, v7, v8, v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertObject_atIndex_(v17, v21, (uint64_t)v12, v16, v22);
  }
  else
  {
LABEL_3:
    objc_msgSend_transformations(self, v7, v8, v9, v10, v40, v41, v42, v43, v44);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v17, v18, (uint64_t)v40, v19, v20);
  }

  objc_msgSend_transformations(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v27, v28, (uint64_t)&unk_1E4A9F468, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend_mutableCopy(v31, v32, v33, v34, v35);
  objc_msgSend_setTransformations_(self, v37, (uint64_t)v36, v38, v39);

  if (v5)
}

- (id)xmlEscaped
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  TTSSpeechString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend_replaceOccurencesOfString_withString_(self, a2, (uint64_t)CFSTR("&"), (uint64_t)CFSTR("&amp;"), v2);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v4, (uint64_t)CFSTR(">"), (uint64_t)CFSTR("&gt;"), v5);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v6, (uint64_t)CFSTR("\"), (uint64_t)CFSTR("&quot;"), v7);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v8, (uint64_t)CFSTR("'"), (uint64_t)CFSTR("&apos;"), v9);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v10, (uint64_t)CFSTR("<"), (uint64_t)CFSTR("&lt;"), v11);
  v12 = [TTSSpeechString alloc];
  return (id)objc_msgSend_initWithParentSpeechString_(v12, v13, (uint64_t)self, v14, v15);
}

- (id)xmlUnescaped
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  TTSSpeechString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend_replaceOccurencesOfString_withString_(self, a2, (uint64_t)CFSTR("&lt;"), (uint64_t)CFSTR("<"), v2);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v4, (uint64_t)CFSTR("&gt;"), (uint64_t)CFSTR(">"), v5);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v6, (uint64_t)CFSTR("&quot;"), (uint64_t)CFSTR("\"), v7);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v8, (uint64_t)CFSTR("&apos;"), (uint64_t)CFSTR("'"), v9);
  objc_msgSend_replaceOccurencesOfString_withString_(self, v10, (uint64_t)CFSTR("&amp;"), (uint64_t)CFSTR("&"), v11);
  v12 = [TTSSpeechString alloc];
  return (id)objc_msgSend_initWithParentSpeechString_(v12, v13, (uint64_t)self, v14, v15);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setTransformedString:(id)a3
{
  objc_storeStrong((id *)&self->_transformedString, a3);
}

- (NSString)originalString
{
  return self->_originalString;
}

- (void)setOriginalString:(id)a3
{
  objc_storeStrong((id *)&self->_originalString, a3);
}

- (TTSSpeechString)parentString
{
  return self->_parentString;
}

- (void)setParentString:(id)a3
{
  objc_storeStrong((id *)&self->_parentString, a3);
}

- (NSMutableArray)transformations
{
  return self->_transformations;
}

- (void)setTransformations:(id)a3
{
  objc_storeStrong((id *)&self->_transformations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformations, 0);
  objc_storeStrong((id *)&self->_parentString, 0);
  objc_storeStrong((id *)&self->_originalString, 0);
  objc_storeStrong((id *)&self->_transformedString, 0);
}

@end
