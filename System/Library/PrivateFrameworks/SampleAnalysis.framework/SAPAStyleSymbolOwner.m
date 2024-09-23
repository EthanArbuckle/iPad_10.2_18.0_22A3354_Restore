@implementation SAPAStyleSymbolOwner

+ (id)classDictionaryKey
{
  return CFSTR("PASymbolOwner");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolOwner"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolOwner"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSymbolOwner"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id result;
  char v7;
  id v8;

  if ((unint64_t)(*(_QWORD *)a3 - 4293844428) >= 2 && *(_QWORD *)a3 != 287454020)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Bad PASymbolOwner magic"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  result = objc_alloc_init(SAPAStyleSymbolOwner);
  *((_QWORD *)result + 2) = *((_QWORD *)a3 + 4);
  if (*(_QWORD *)a3 < 0xFFEEDDCDuLL)
    v7 = 0;
  else
    v7 = *((_BYTE *)a3 + 80);
  *((_BYTE *)result + 8) = v7;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  unint64_t textSegmentLength;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  _QWORD *v58;
  unint64_t v59;
  int64_t v60;
  id Property;
  uint64_t v62;
  const char *v63;
  unint64_t v64;
  unint64_t v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  id v80;
  id v81;
  uint64_t v82;
  unint64_t v83;
  const __CFString *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id newValue;
  _QWORD *v95;
  id selfa;
  id obj;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if ((unint64_t)(*(_QWORD *)a3 - 4293844428) >= 2 && *(_QWORD *)a3 != 287454020)
  {
LABEL_78:
    v84 = CFSTR("Bad PASymbolOwner magic");
    goto LABEL_80;
  }
  v12 = v10;
  v13 = *((_QWORD *)a3 + 3);
  v14 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v9, v12, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = *((_QWORD *)a3 + 1);
    v17 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v9, v12, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *((_QWORD *)a3 + 2);
    v20 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v19, v9, v12, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *((_QWORD *)a3 + 5);
    v23 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v22, v9, v12, v23, 0);
    newValue = (id)objc_claimAutoreleasedReturnValue();
    v24 = *((_QWORD *)a3 + 6);
    v25 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v9, v12, v25, 0);
    v93 = (id)objc_claimAutoreleasedReturnValue();
    v26 = *((_QWORD *)a3 + 7);
    v27 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v9, v12, v27, 0);
    v92 = (id)objc_claimAutoreleasedReturnValue();
    v28 = *((_QWORD *)a3 + 8);
    v29 = (void *)objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v28, v9, v12, v29, 0);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isAbsolutePath"))
      v30 = v21;
    else
      v30 = 0;
    +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v15, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    selfa = v31;
    if (self->_hasTextExecSegment
      && ((-[SABinary segmentWithCleanName:](v31, CFSTR("__TEXT_EXEC")),
           (v32 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0)
       || (+[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, selfa, CFSTR("__TEXT_EXEC"), self->_textSegmentLength), v32 = (_QWORD *)objc_claimAutoreleasedReturnValue(), -[SABinary addSegment:](selfa, v32), v31 = selfa, v32)))
    {
      v95 = v32;
      if (!objc_msgSend(v32, "length"))
      {
        textSegmentLength = self->_textSegmentLength;
        if (textSegmentLength)
          -[SASegment setLength:](v32, textSegmentLength);
      }
      v99 = 0;
    }
    else
    {
      if (!objc_msgSend(v31, "length"))
      {
        v83 = self->_textSegmentLength;
        if (v83)
        {
          v34 = selfa;
          -[SABinary setLength:](selfa, v83);
          v95 = 0;
          v99 = 1;
          goto LABEL_20;
        }
      }
      v95 = 0;
      v99 = 1;
    }
    v34 = selfa;
LABEL_20:
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
      -[SABinary setName:](v34, v18);
    objc_msgSend(v34, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v34;
    if (!v36 && v34)
    {
      objc_setProperty_atomic_copy(v34, v37, v21, 80);
      v38 = selfa;
    }
    objc_msgSend(v38, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = selfa;
    if (!v39 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v40, newValue, 88);
      v41 = selfa;
    }
    objc_msgSend(v41, "bundleVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = selfa;
    if (!v42 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v43, v93, 96);
      v44 = selfa;
    }
    objc_msgSend(v44, "bundleShortVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = selfa;
    if (!v45 && selfa)
    {
      objc_setProperty_atomic_copy(selfa, v46, v92, 104);
      v47 = selfa;
    }
    v48 = v47;
    objc_msgSend(v47, "binaryVersion");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49 && v48)
      objc_setProperty_atomic_copy(v48, v50, v91, 112);
    v51 = *(_QWORD *)a3;
    if (*(_QWORD *)a3 < 0xFFEEDDCCuLL)
      goto LABEL_78;
    if (v51 == 4293844428)
    {
      v52 = 80;
    }
    else
    {
      if (v51 != 4293844429)
      {
        v84 = CFSTR("Bad PASerializedSymbolOwner magic");
LABEL_80:
        +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v84, 0);
        v85 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v85);
      }
      v52 = 81;
    }
    v53 = *((_QWORD *)a3 + 9);
    if (v53)
    {
      v86 = v21;
      v87 = v18;
      v88 = v15;
      v54 = (char *)a3 + v52;
      v55 = (void *)objc_opt_class();
      v89 = v12;
      v90 = v9;
      SASerializableNewMutableArrayFromIndexList((uint64_t)v54, v53, v9, v12, v55);
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
      if (v100)
      {
        v98 = *(_QWORD *)v107;
        do
        {
          v57 = 0;
          do
          {
            if (*(_QWORD *)v107 != v98)
              objc_enumerationMutation(obj);
            v58 = *(_QWORD **)(*((_QWORD *)&v106 + 1) + 8 * v57);
            if ((v99 & 1) != 0)
            {
              if (v58)
              {
                v60 = v58[2];
                v59 = v58[3];
                Property = objc_getProperty(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v57), v56, 8, 1);
              }
              else
              {
                v59 = 0;
                v60 = 0;
                Property = 0;
              }
              -[SABinary addSymbolWithOffsetIntoBinary:length:name:](selfa, v60, v59, Property);
              v62 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v58)
              {
                v65 = v58[2];
                v64 = v58[3];
                v66 = objc_getProperty(*(id *)(*((_QWORD *)&v106 + 1) + 8 * v57), v56, 8, 1);
              }
              else
              {
                v64 = 0;
                v65 = 0;
                v66 = 0;
              }
              -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v95, v65, v64, v66);
              v62 = objc_claimAutoreleasedReturnValue();
            }
            v67 = (void *)v62;
            v104 = 0u;
            v105 = 0u;
            v102 = 0u;
            v103 = 0u;
            v101 = v57;
            if (v58)
              v68 = objc_getProperty(v58, v63, 32, 1);
            else
              v68 = 0;
            v69 = v68;
            v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
            if (v70)
            {
              v72 = v70;
              v73 = *(_QWORD *)v103;
              do
              {
                for (i = 0; i != v72; ++i)
                {
                  if (*(_QWORD *)v103 != v73)
                    objc_enumerationMutation(v69);
                  v75 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * i);
                  if (v75 && objc_getProperty(*(id *)(*((_QWORD *)&v102 + 1) + 8 * i), v71, 32, 1))
                  {
                    v76 = *(_QWORD *)(v75 + 16);
                    v77 = *(_QWORD *)(v75 + 24);
                    v79 = *(_DWORD *)(v75 + 8);
                    v78 = *(_DWORD *)(v75 + 12);
                    v80 = objc_getProperty((id)v75, v71, 32, 1);
                    v81 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v67, v76, v77, v79, v78, v80);
                  }
                }
                v72 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
              }
              while (v72);
            }

            v57 = v101 + 1;
          }
          while (v101 + 1 != v100);
          v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v111, 16);
          v100 = v82;
        }
        while (v82);
      }

      v12 = v89;
      v9 = v90;
      v18 = v87;
      v15 = v88;
      v21 = v86;
    }

  }
}

@end
