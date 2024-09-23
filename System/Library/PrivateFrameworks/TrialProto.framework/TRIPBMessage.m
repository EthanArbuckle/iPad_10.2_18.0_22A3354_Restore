@implementation TRIPBMessage

- (TRIPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  TRIPBMessage *v8;
  TRIPBMessage *v9;

  v8 = -[TRIPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TRIPBMessage mergeFromData:extensionRegistry:](v8, "mergeFromData:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
    if (!-[TRIPBMessage isInitialized](v9, "isInitialized"))
    {

      v9 = 0;
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBMessageErrorDomain"), -101, 0);
    }
  }
  return v9;
}

- (BOOL)isInitialized
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  char IsInitializedInternalHelper;
  TRIPBMessage_Storage *messageStorage;
  void *v12;
  int v13;
  TRIPBMessage_Storage *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *extensionMap;
  BOOL v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = *(void **)(-[TRIPBMessage descriptor](self, "descriptor") + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v6)
        objc_enumerationMutation(v4);
      v8 = *(_QWORD **)(*((_QWORD *)&v31 + 1) + 8 * v7);
      if (objc_msgSend(v8, "isRequired")
        && !TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v8[1] + 20), *(_DWORD *)(v8[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v8[1] + 30) - 15 > 1)
        goto LABEL_39;
      v9 = objc_msgSend(v8, "fieldType");
      if (v9 == 1)
      {
        messageStorage = self->messageStorage_;
        if (messageStorage)
          v12 = *(void **)((char *)messageStorage + *(unsigned int *)(v8[1] + 24));
        else
          v12 = 0;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v28;
LABEL_24:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v12);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "isInitialized"))
              return 0;
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v16)
                goto LABEL_24;
              goto LABEL_39;
            }
          }
        }
        goto LABEL_39;
      }
      if (v9)
      {
        v13 = objc_msgSend(v8, "mapKeyDataType");
        v14 = self->messageStorage_;
        if (v14)
          v15 = *(void **)((char *)v14 + *(unsigned int *)(v8[1] + 24));
        else
          v15 = 0;
        if (v13 != 14)
        {
          if (v15 && !objc_msgSend(v15, "isInitialized"))
            return 0;
          goto LABEL_39;
        }
        if (v15)
        {
          IsInitializedInternalHelper = TRIPBDictionaryIsInitializedInternalHelper(v15, v8);
LABEL_35:
          if ((IsInitializedInternalHelper & 1) == 0)
            return 0;
        }
      }
      else
      {
        if (objc_msgSend(v8, "isRequired"))
          goto LABEL_12;
        if ((objc_msgSend(v8, "isOptional") & 1) == 0)
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBMessage.m"), 1157, CFSTR("%@: Single message field %@ not required or optional?"), objc_opt_class(), objc_msgSend(v8, "name"));
        if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v8[1] + 20), *(_DWORD *)(v8[1] + 16)))
        {
LABEL_12:
          IsInitializedInternalHelper = objc_msgSend((id)TRIPBGetObjectIvarWithField((uint64_t)self, v8), "isInitialized");
          goto LABEL_35;
        }
      }
LABEL_39:
      if (++v7 == v5)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  extensionMap = self->extensionMap_;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __29__TRIPBMessage_isInitialized__block_invoke;
  v22[3] = &unk_1E2E9B5B8;
  v22[4] = &v23;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v22);
  v20 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  return v20;
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  _QWORD *v6;
  uint64_t *v7;
  void *v8;
  unint64_t v9;
  uint64_t Tag;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  int v23;
  TRIPBMessage *v24;
  uint64_t v25;
  uint64_t v26;
  int RawVarint64;
  uint64_t v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  TRIPBMessage *v36;
  uint64_t v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t RetainedBytes;
  void *v41;
  TRIPBMessage *v42;
  uint64_t v43;
  TRIPBMessage_Storage *messageStorage;
  uint64_t v45;
  TRIPBMessage_Storage *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  int v51;

  v6 = -[TRIPBMessage descriptor](self, "descriptor");
  v51 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
  v7 = (uint64_t *)((char *)a3 + 8);
  v8 = (void *)v6[1];
  v9 = objc_msgSend(v8, "count");
  Tag = TRIPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if (!(_DWORD)Tag)
    return;
  v11 = Tag;
  v12 = 0;
  do
  {
    if (!v9)
    {
LABEL_19:
      if (-[TRIPBMessage parseUnknownField:extensionRegistry:tag:](self, "parseUnknownField:extensionRegistry:tag:", a3, a4, v11))
      {
        goto LABEL_31;
      }
      return;
    }
    v13 = v9;
    do
    {
      if (v12 >= v9)
        v12 = 0;
      v14 = (_QWORD *)objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v15 = v14;
      v16 = v14[1];
      if ((*(_WORD *)(v16 + 28) & 0xF04) != 0)
        v17 = 2;
      else
        v17 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v16 + 30)];
      if ((v17 | (8 * *(_DWORD *)(v16 + 16))) == (_DWORD)v11)
      {
        v19 = objc_msgSend(v14, "fieldType");
        if (v19 == 1)
        {
          if (!objc_msgSend(v15, "isPackable"))
            goto LABEL_30;
LABEL_26:
          MergeRepeatedPackedFieldFromCodedInputStream(self, v15, v51, a3);
        }
        else
        {
          if (v19)
          {
            objc_msgSend(a3, "readMapEntry:extensionRegistry:field:parentMessage:", GetOrCreateMapIvarWithField(self, v15, v51), a4, v15, self);
            goto LABEL_31;
          }
          v20 = v15[1];
          switch(*(_BYTE *)(v20 + 30))
          {
            case 0:
              v21 = ReadRawVarint64(v7) != 0;
              TRIPBSetBoolIvarWithFieldInternal(self, (uint64_t)v15, v21, v51);
              break;
            case 1:
              CheckSize((uint64_t)v7, 4);
              v22 = *((_QWORD *)a3 + 3);
              v23 = *(_DWORD *)(*((_QWORD *)a3 + 1) + v22);
              *((_QWORD *)a3 + 3) = v22 + 4;
              v24 = self;
              v25 = (uint64_t)v15;
              goto LABEL_46;
            case 2:
              CheckSize((uint64_t)v7, 4);
              v26 = *((_QWORD *)a3 + 3);
              RawVarint64 = *(_DWORD *)(*((_QWORD *)a3 + 1) + v26);
              *((_QWORD *)a3 + 3) = v26 + 4;
              goto LABEL_42;
            case 3:
              CheckSize((uint64_t)v7, 4);
              v28 = *((_QWORD *)a3 + 3);
              v29 = *(float *)(*((_QWORD *)a3 + 1) + v28);
              *((_QWORD *)a3 + 3) = v28 + 4;
              TRIPBSetFloatIvarWithFieldInternal(self, (uint64_t)v15, v51, v29);
              break;
            case 4:
              CheckSize((uint64_t)v7, 8);
              v30 = *((_QWORD *)a3 + 3);
              v31 = *(_QWORD *)(*((_QWORD *)a3 + 1) + v30);
              *((_QWORD *)a3 + 3) = v30 + 8;
              goto LABEL_48;
            case 5:
              CheckSize((uint64_t)v7, 8);
              v32 = *((_QWORD *)a3 + 3);
              v33 = *(_QWORD *)(*((_QWORD *)a3 + 1) + v32);
              *((_QWORD *)a3 + 3) = v32 + 8;
              goto LABEL_44;
            case 6:
              CheckSize((uint64_t)v7, 8);
              v34 = *((_QWORD *)a3 + 3);
              v35 = *(double *)(*((_QWORD *)a3 + 1) + v34);
              *((_QWORD *)a3 + 3) = v34 + 8;
              TRIPBSetDoubleIvarWithFieldInternal(self, (uint64_t)v15, v51, v35);
              break;
            case 7:
              RawVarint64 = ReadRawVarint64(v7);
              v36 = self;
              v37 = (uint64_t)v15;
              goto LABEL_61;
            case 8:
              v33 = ReadRawVarint64(v7);
              goto LABEL_44;
            case 9:
              v38 = ReadRawVarint64(v7);
              RawVarint64 = -(v38 & 1) ^ (v38 >> 1);
LABEL_42:
              v36 = self;
              v37 = (uint64_t)v15;
              goto LABEL_61;
            case 0xA:
              v39 = ReadRawVarint64(v7);
              v33 = -(uint64_t)(v39 & 1) ^ (v39 >> 1);
LABEL_44:
              TRIPBSetInt64IvarWithFieldInternal(self, (uint64_t)v15, v33, v51);
              break;
            case 0xB:
              v23 = ReadRawVarint64(v7);
              v24 = self;
              v25 = (uint64_t)v15;
LABEL_46:
              TRIPBSetUInt32IvarWithFieldInternal(v24, v25, v23, v51);
              break;
            case 0xC:
              v31 = ReadRawVarint64(v7);
LABEL_48:
              TRIPBSetUInt64IvarWithFieldInternal(self, (uint64_t)v15, v31, v51);
              break;
            case 0xD:
              RetainedBytes = TRIPBCodedInputStreamReadRetainedBytes(v7);
              goto LABEL_51;
            case 0xE:
              RetainedBytes = (uint64_t)TRIPBCodedInputStreamReadRetainedString(v7);
LABEL_51:
              v41 = (void *)RetainedBytes;
              v42 = self;
              v43 = (uint64_t)v15;
              goto LABEL_65;
            case 0xF:
              if (!TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v20 + 20), *(_DWORD *)(v20 + 16)))
              {
                v50 = objc_alloc_init((Class)objc_msgSend(v15, "msgClass"));
                objc_msgSend(a3, "readMessage:extensionRegistry:", v50, a4);
                goto LABEL_64;
              }
              messageStorage = self->messageStorage_;
              if (messageStorage)
                v45 = *(_QWORD *)((char *)messageStorage + *(unsigned int *)(v15[1] + 24));
              else
                v45 = 0;
              objc_msgSend(a3, "readMessage:extensionRegistry:", v45, a4);
              break;
            case 0x10:
              if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v20 + 20), *(_DWORD *)(v20 + 16)))
              {
                v46 = self->messageStorage_;
                v47 = v15[1];
                if (v46)
                  v48 = *(_QWORD *)((char *)v46 + *(unsigned int *)(v47 + 24));
                else
                  v48 = 0;
                objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v47 + 16), v48, a4);
              }
              else
              {
                v50 = objc_alloc_init((Class)objc_msgSend(v15, "msgClass"));
                objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v15[1] + 16), v50, a4);
LABEL_64:
                v42 = self;
                v43 = (uint64_t)v15;
                v41 = v50;
LABEL_65:
                TRIPBSetRetainedObjectIvarWithFieldInternal(v42, v43, v41, v51);
              }
              break;
            case 0x11:
              v49 = ReadRawVarint64(v7);
              if (v51 == 3 || objc_msgSend(v15, "isValidEnumValue:", v49))
              {
                v36 = self;
                v37 = (uint64_t)v15;
                RawVarint64 = v49;
LABEL_61:
                TRIPBSetInt32IvarWithFieldInternal(v36, v37, RawVarint64, v51);
              }
              else
              {
                objc_msgSend((id)GetOrMakeUnknownFields(self), "mergeVarintField:value:", *(unsigned int *)(v15[1] + 16), v49);
              }
              break;
            default:
              break;
          }
        }
        ++v12;
        goto LABEL_31;
      }
      ++v12;
      --v13;
    }
    while (v13);
    v18 = v9;
    while (1)
    {
      if (v12 >= v9)
        v12 = 0;
      v15 = (_QWORD *)objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      if (objc_msgSend(v15, "fieldType") == 1
        && *(unsigned __int8 *)(v15[1] + 30) - 13 >= 4
        && TRIPBFieldAlternateTag((uint64_t)v15) == (_DWORD)v11)
      {
        break;
      }
      ++v12;
      if (!--v18)
        goto LABEL_19;
    }
    if ((objc_msgSend(v15, "isPackable") & 1) == 0)
      goto LABEL_26;
LABEL_30:
    MergeRepeatedNotPackedFieldFromCodedInputStream(self, v15, v51, (uint64_t *)a3, (uint64_t)a4);
LABEL_31:
    v11 = TRIPBCodedInputStreamReadTag((uint64_t)v7);
  }
  while ((_DWORD)v11);
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  _QWORD *v7;
  TRIPBMessage *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  TRIPBMessage_Storage *messageStorage;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  TRIPBMessage_Storage *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  _QWORD *v37;
  TRIPBMessage *v38;
  void *v39;
  uint64_t v40;
  int v41;
  _QWORD v42[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v7 = a3;
  v8 = self;
  v53 = *MEMORY[0x1E0C80C00];
  memcpy(*((void **)a3 + 8), self->messageStorage_, *((unsigned int *)a5 + 6));
  v41 = objc_msgSend((id)objc_msgSend(a5, "file"), "syntax");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = (void *)*((_QWORD *)a5 + 1);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v48;
    v38 = v8;
    v39 = v9;
    v37 = v7;
    do
    {
      v13 = 0;
      v40 = v11;
      do
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD **)(*((_QWORD *)&v47 + 1) + 8 * v13);
        v15 = v14[1];
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          messageStorage = v8->messageStorage_;
          if (messageStorage)
          {
            v17 = *(void **)((char *)messageStorage + *(unsigned int *)(v15 + 24));
            if (v17)
            {
              v18 = v12;
              v19 = *(unsigned __int8 *)(v15 + 30) - 15;
              v20 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v13), "fieldType");
              if (v19 <= 1)
              {
                if (v20 == 1)
                {
                  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
                  v43 = 0u;
                  v44 = 0u;
                  v45 = 0u;
                  v46 = 0u;
                  v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
                  if (v22)
                  {
                    v23 = v22;
                    v24 = *(_QWORD *)v44;
                    do
                    {
                      for (i = 0; i != v23; ++i)
                      {
                        if (*(_QWORD *)v44 != v24)
                          objc_enumerationMutation(v17);
                        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "copyWithZone:", a4);
                        objc_msgSend(v21, "addObject:", v26);

                      }
                      v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
                    }
                    while (v23);
                    v7 = v37;
                    v8 = v38;
                    v9 = v39;
                  }
                  else
                  {
                    v8 = v38;
                  }
                  v12 = v18;
                  goto LABEL_41;
                }
                v12 = v18;
                if (objc_msgSend(v14, "mapKeyDataType") == 14)
                {
                  v30 = objc_alloc(MEMORY[0x1E0C99E08]);
                  v31 = objc_msgSend(v17, "count");
                  v32 = v30;
                  v9 = v39;
                  v21 = (void *)objc_msgSend(v32, "initWithCapacity:", v31);
                  v42[0] = MEMORY[0x1E0C809B0];
                  v42[1] = 3221225472;
                  v42[2] = __47__TRIPBMessage_copyFieldsInto_zone_descriptor___block_invoke;
                  v42[3] = &unk_1E2E9B590;
                  v42[4] = v21;
                  v42[5] = a4;
                  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v42);
LABEL_41:
                  v11 = v40;
                  v36 = v17;
                  TRIPBSetRetainedObjectIvarWithFieldInternal(v7, (uint64_t)v14, v21, v41);
                  goto LABEL_42;
                }
                v33 = objc_msgSend(v17, "deepCopyWithZone:", a4);
LABEL_38:
                v21 = (void *)v33;
                goto LABEL_41;
              }
              if (v20 == 1)
              {
                v12 = v18;
                if (*(unsigned __int8 *)(v14[1] + 30) - 13 > 3)
                {
LABEL_34:
                  v33 = objc_msgSend(v17, "copyWithZone:", a4);
                  goto LABEL_38;
                }
              }
              else
              {
                v12 = v18;
                if (objc_msgSend(v14, "mapKeyDataType") != 14
                  || *(unsigned __int8 *)(v14[1] + 30) - 13 > 3)
                {
                  goto LABEL_34;
                }
              }
              v33 = objc_msgSend(v17, "mutableCopyWithZone:", a4);
              goto LABEL_38;
            }
          }
        }
        else
        {
          v27 = *(unsigned __int8 *)(v15 + 30);
          if ((v27 - 15) > 1)
          {
            if ((v27 - 13) > 3
              || !TRIPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              goto LABEL_42;
            }
          }
          else if (!TRIPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          {
            *(_QWORD *)(v7[8] + *(unsigned int *)(v14[1] + 24)) = 0;
            goto LABEL_42;
          }
          v28 = v8->messageStorage_;
          if (v28)
            v29 = *(void **)((char *)v28 + *(unsigned int *)(v14[1] + 24));
          else
            v29 = 0;
          v34 = (void *)objc_msgSend(v29, "copyWithZone:", a4);
          v35 = v29;
          TRIPBSetRetainedObjectIvarWithFieldInternal(v7, (uint64_t)v14, v34, v41);
          v9 = v39;
        }
LABEL_42:
        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v11);
  }
}

- (void)internalClear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  uint64_t v10;
  TRIPBMessage_Storage *messageStorage;
  _QWORD *v12;
  int v13;
  TRIPBMessage_Storage *v14;
  _QWORD *v15;
  TRIPBMessage *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v25 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = -[TRIPBMessage descriptor](self, "descriptor");
  v4 = (void *)v24[1];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          messageStorage = self->messageStorage_;
          if (messageStorage)
          {
            v12 = *(_QWORD **)((char *)messageStorage + *(unsigned int *)(v10 + 24));
            if (v12)
            {
              if (objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "fieldType") == 1)
              {
                if (*(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
LABEL_23:
                    v15 = v12 + 1;
                    v16 = (TRIPBMessage *)v12[1];
LABEL_25:
                    if (v16 == self)
                      *v15 = 0;
                  }
LABEL_27:

                  continue;
                }
              }
              else if (objc_msgSend(v9, "mapKeyDataType") == 14
                     && *(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  goto LABEL_23;
                goto LABEL_27;
              }
              v15 = v12 + 1;
              v16 = (TRIPBMessage *)v12[1];
              goto LABEL_25;
            }
          }
        }
        else
        {
          v13 = *(unsigned __int8 *)(v10 + 30);
          if ((v13 - 15) > 1)
          {
            if ((v13 - 13) <= 3
              && TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
            {

            }
          }
          else
          {
            TRIPBClearAutocreatedMessageIvarWithField((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v14 = self->messageStorage_;
            if (v14)
              v14 = *(TRIPBMessage_Storage **)((char *)v14 + *(unsigned int *)(v9[1] + 24));

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v6);
  }
  v17 = (void *)-[NSMutableDictionary allValues](self->autocreatedExtensionMap_, "allValues");

  self->autocreatedExtensionMap_ = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        if (*(TRIPBMessage **)(v22 + 32) != self)
        {
          v23 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TRIPBMessage internalClear:]"), CFSTR("TRIPBMessage.m"), 1119, CFSTR("Autocreated extension does not refer back to self."));
        }
        TRIPBClearMessageAutocreator(v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v25)
    bzero(self->messageStorage_, *((unsigned int *)v24 + 6));
}

- (id)descriptor
{
  return (id)objc_msgSend((id)objc_opt_class(), "descriptor");
}

- (void)dealloc
{
  NSObject *v4;
  void *v5;
  objc_super v6;

  -[TRIPBMessage internalClear:](self, "internalClear:", 0);
  if (self->autocreator_)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TRIPBMessage dealloc]"), CFSTR("TRIPBMessage.m"), 926, CFSTR("Autocreator was not cleared before dealloc."));
  }
  if (atomic_load((unint64_t *)&self->readOnlySemaphore_))
  {
    v4 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_release(v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)TRIPBMessage;
  -[TRIPBMessage dealloc](&v6, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;

  v5 = -[TRIPBMessage descriptor](self, "descriptor");
  v6 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "messageClass"), "allocWithZone:", a3), "init");
  -[TRIPBMessage copyFieldsInto:zone:descriptor:](self, "copyFieldsInto:zone:descriptor:", v6, a3, v5);
  v6[1] = -[TRIPBUnknownFieldSet copyWithZone:](self->unknownFields_, "copyWithZone:", a3);
  v6[2] = CloneExtensionMap(self->extensionMap_, (uint64_t)a3);
  return v6;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, *(unsigned int *)(objc_msgSend(a1, "descriptor") + 24), a3);
}

- (TRIPBMessage)init
{
  TRIPBMessage *v2;
  objc_class *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIPBMessage;
  v2 = -[TRIPBMessage init](&v5, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v2->messageStorage_ = (TRIPBMessage_Storage *)((char *)v2 + class_getInstanceSize(v3));
  }
  return v2;
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return TRIPBGetHasOneof(a2, *(unsigned int *)(a1 + 32));
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  TRIPBCodedInputStream *v6;

  v6 = -[TRIPBCodedInputStream initWithData:]([TRIPBCodedInputStream alloc], "initWithData:", a3);
  -[TRIPBMessage mergeFromCodedInputStream:extensionRegistry:](self, "mergeFromCodedInputStream:extensionRegistry:", v6, a4);
  -[TRIPBCodedInputStream checkLastTagWas:](v6, "checkLastTagWas:", 0);

}

+ (void)initialize
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (objc_opt_class() == v3)
  {
    objc_msgSend(a1, "descriptor");
    objc_opt_class();
  }
  else if (objc_msgSend(a1, "superclass") == v3)
  {
    objc_msgSend(a1, "descriptor");
  }
}

+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:extensionRegistry:error:", a3, a4, a5);
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int32x2_t *v13;
  const char *v14;
  uint64_t v15;
  void *v17;
  uint64_t *v18;
  char v19;
  void (*v20)(void);
  const char *v21;
  char **v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  int32x2_t v28;
  __int32 v29;
  BOOL v30;
  char *v31;
  objc_class *v32;
  objc_super v34;
  _QWORD v35[5];
  _QWORD block[5];
  char v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];
  __int32 v41;
  _QWORD v42[5];
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  char v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "descriptor");
  if (!v5)
  {
    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___TRIPBMessage;
    return objc_msgSendSuper2(&v48, sel_resolveInstanceMethod_, a3, v34.receiver, v34.super_class);
  }
  v6 = (void *)v5;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = *(void **)(v5 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (!v8)
    return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
  v9 = v8;
  v10 = *(_QWORD *)v45;
LABEL_4:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v10)
      objc_enumerationMutation(v7);
    v12 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v11);
    v13 = *(int32x2_t **)(v12 + 8);
    v14 = *(const char **)(v12 + 24);
    if ((v13[3].i16[2] & 0xF02) == 0)
      break;
    if (v14 == a3)
    {
      if (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v11), "fieldType") == 1)
      {
        v39 = MEMORY[0x1E0C809B0];
        v17 = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_4;
        v18 = &v39;
      }
      else
      {
        v38 = MEMORY[0x1E0C809B0];
        v17 = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_5;
        v18 = &v38;
      }
      v18[1] = 3221225472;
      v18[2] = (uint64_t)v17;
      v18[3] = (uint64_t)&__block_descriptor_40_e8__16__0_8ls32l8;
      v18[4] = v12;
      v20 = imp_implementationWithBlock(v18);
      v21 = sel_getArray;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 32) == a3)
    {
      v19 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_6;
      block[3] = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      block[4] = v12;
      v37 = v19;
      v20 = imp_implementationWithBlock(block);
      v21 = sel_setArray_;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 40) == a3)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_7;
      v35[3] = &__block_descriptor_40_e8_Q16__0_8ls32l8;
      v35[4] = v12;
      v20 = imp_implementationWithBlock(v35);
      v21 = sel_getArrayCount;
      goto LABEL_72;
    }
LABEL_18:
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v9)
        goto LABEL_4;
      return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
    }
  }
  if (v14 == a3)
  {
    switch(v13[3].i8[6])
    {
      case 0:
        v22 = &selRef_getBool;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_B16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke;
        goto LABEL_52;
      case 1:
        v22 = &selRef_getFixed32;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_I16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_2;
        goto LABEL_52;
      case 2:
        v22 = &selRef_getSFixed32;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_3;
        goto LABEL_52;
      case 3:
        v22 = &selRef_getFloat;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_f16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_4;
        goto LABEL_52;
      case 4:
        v22 = &selRef_getFixed64;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_Q16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_5;
        goto LABEL_52;
      case 5:
        v22 = &selRef_getSFixed64;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_6;
        goto LABEL_52;
      case 6:
        v22 = &selRef_getDouble;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_d16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_7;
        goto LABEL_52;
      case 7:
        v22 = &selRef_getInt32;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_8;
        goto LABEL_52;
      case 8:
        v22 = &selRef_getInt64;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_9;
        goto LABEL_52;
      case 9:
        v22 = &selRef_getSInt32;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_10;
        goto LABEL_52;
      case 0xA:
        v22 = &selRef_getSInt64;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_q16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_11;
        goto LABEL_52;
      case 0xB:
        v22 = &selRef_getUInt32;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_I16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_12;
        goto LABEL_52;
      case 0xC:
        v22 = &selRef_getUInt64;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_Q16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_13;
        goto LABEL_52;
      case 0xD:
        v22 = &selRef_getBytes;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_14;
        goto LABEL_52;
      case 0xE:
        v22 = &selRef_getString;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_15;
        goto LABEL_52;
      case 0xF:
        v22 = &selRef_getMessage;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_16;
        goto LABEL_52;
      case 0x10:
        v22 = &selRef_getGroup;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8__16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_17;
        goto LABEL_52;
      case 0x11:
        v22 = &selRef_getEnum;
        v49 = MEMORY[0x1E0C809B0];
        v23 = &__block_descriptor_40_e8_i16__0_8ls32l8;
        v24 = __ResolveIvarGet_block_invoke_18;
LABEL_52:
        v50 = 3221225472;
        v51 = v24;
        v52 = v23;
        v53 = v12;
        goto LABEL_71;
      default:
LABEL_34:
        v20 = 0;
        v21 = 0;
        goto LABEL_72;
    }
  }
  if (*(SEL *)(v12 + 32) != a3)
  {
    if (*(SEL *)(v12 + 40) == a3)
    {
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v28 = v13[2];
      v43[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke;
      v43[3] = &__block_descriptor_40_e8_B16__0_8l;
      v43[4] = vrev64_s32(v28);
      v20 = imp_implementationWithBlock(v43);
      v21 = sel_getBool;
      goto LABEL_72;
    }
    if (*(SEL *)(v12 + 48) == a3)
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_2;
      v42[3] = &__block_descriptor_40_e11_v20__0_8B16ls32l8;
      v42[4] = v12;
      v20 = imp_implementationWithBlock(v42);
      v21 = sel_setBool_;
      goto LABEL_72;
    }
    v15 = *(_QWORD *)(v12 + 16);
    if (v15 && *(SEL *)(v15 + 24) == a3)
    {
      v29 = v13[2].i32[1];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __38__TRIPBMessage_resolveInstanceMethod___block_invoke_3;
      v40[3] = &__block_descriptor_36_e8_I16__0_8l;
      v41 = v29;
      v20 = imp_implementationWithBlock(v40);
      v21 = sel_getEnum;
      goto LABEL_72;
    }
    goto LABEL_18;
  }
  v25 = objc_msgSend((id)objc_msgSend(v6, "file"), "syntax");
  switch(*(_BYTE *)(*(_QWORD *)(v12 + 8) + 30))
  {
    case 0:
      v22 = &selRef_setBool_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8B16ls32l8;
      v27 = __ResolveIvarSet_block_invoke;
      break;
    case 1:
      v22 = &selRef_setFixed32_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8I16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_2;
      break;
    case 2:
      v22 = &selRef_setSFixed32_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_3;
      break;
    case 3:
      v22 = &selRef_setFloat_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8f16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_4;
      break;
    case 4:
      v22 = &selRef_setFixed64_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8Q16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_5;
      break;
    case 5:
      v22 = &selRef_setSFixed64_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_6;
      break;
    case 6:
      v22 = &selRef_setDouble_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8d16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_7;
      break;
    case 7:
      v22 = &selRef_setInt32_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_8;
      break;
    case 8:
      v22 = &selRef_setInt64_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_9;
      break;
    case 9:
      v22 = &selRef_setSInt32_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_10;
      break;
    case 0xA:
      v22 = &selRef_setSInt64_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8q16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_11;
      break;
    case 0xB:
      v22 = &selRef_setUInt32_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8I16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_12;
      break;
    case 0xC:
      v22 = &selRef_setUInt64_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8Q16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_13;
      break;
    case 0xD:
      v22 = &selRef_setBytes_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_14;
      break;
    case 0xE:
      v22 = &selRef_setString_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_15;
      break;
    case 0xF:
      v22 = &selRef_setMessage_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_16;
      break;
    case 0x10:
      v22 = &selRef_setGroup_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v24__0_8_16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_17;
      break;
    case 0x11:
      v22 = &selRef_setEnum_;
      v49 = MEMORY[0x1E0C809B0];
      v26 = &__block_descriptor_41_e11_v20__0_8i16ls32l8;
      v27 = __ResolveIvarSet_block_invoke_18;
      break;
    default:
      goto LABEL_34;
  }
  v50 = 3221225472;
  v51 = v27;
  v52 = v26;
  v53 = v12;
  v54 = v25;
LABEL_71:
  v20 = imp_implementationWithBlock(&v49);
  v21 = *v22;
LABEL_72:
  if (!v20)
    return objc_msgSendSuper2(&v34, sel_resolveInstanceMethod_, a3, a1, &OBJC_METACLASS___TRIPBMessage);
  v30 = 1;
  v31 = TRIPBMessageEncodingForSelector(v21, 1);
  v32 = (objc_class *)objc_msgSend(v6, "messageClass");
  if (!class_addMethod(v32, a3, v20, v31))
    return TRIPBClassHasSel(v32, a3);
  return v30;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TRIPBMessage_Storage *v14;
  void *v15;
  unsigned int v16;
  int v17;
  int HasIvar;
  int v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;
  TRIPBMessage_Storage *messageStorage;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
    goto LABEL_45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = objc_msgSend((id)objc_opt_class(), "descriptor"), objc_msgSend((id)objc_opt_class(), "descriptor") != v5))
  {
LABEL_4:
    LOBYTE(v6) = 0;
    return v6;
  }
  v31 = *((_QWORD *)a3 + 8);
  messageStorage = self->messageStorage_;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = *(void **)(v5 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
        v13 = *(_QWORD *)(v12 + 8);
        if ((*(_WORD *)(v13 + 28) & 0xF02) != 0)
        {
          v14 = self->messageStorage_;
          if (v14)
            v15 = *(void **)((char *)v14 + *(unsigned int *)(v13 + 24));
          else
            v15 = 0;
          v21 = *((_QWORD *)a3 + 8);
          if (v21)
            v22 = *(void **)(v21 + *(unsigned int *)(v13 + 24));
          else
            v22 = 0;
          if (objc_msgSend(v15, "count") || objc_msgSend(v22, "count"))
          {
            v23 = v15;
            v24 = v22;
LABEL_27:
            if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
              goto LABEL_4;
          }
        }
        else
        {
          v17 = *(_DWORD *)(v13 + 16);
          v16 = *(_DWORD *)(v13 + 20);
          HasIvar = TRIPBGetHasIvar((uint64_t)self, v16, v17);
          v19 = TRIPBGetHasIvar((uint64_t)a3, v16, v17);
          if (HasIvar)
            v20 = v19 == 0;
          else
            v20 = 1;
          if (!v20)
          {
            v25 = *(_QWORD *)(v12 + 8);
            v26 = *(unsigned int *)(v25 + 24);
            switch(*(_BYTE *)(v25 + 30))
            {
              case 0:
                v27 = TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v25 + 24), 0);
                if (v27 != TRIPBGetHasIvar((uint64_t)a3, v26, 0))
                  goto LABEL_4;
                goto LABEL_28;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                if (*(_DWORD *)((char *)messageStorage + v26) != *(_DWORD *)(v31 + v26))
                  goto LABEL_4;
                goto LABEL_28;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                if (*(_QWORD *)((char *)messageStorage + v26) != *(_QWORD *)(v31 + v26))
                  goto LABEL_4;
                goto LABEL_28;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                v23 = *(void **)((char *)messageStorage + v26);
                v24 = *(void **)(v31 + v26);
                goto LABEL_27;
              default:
                goto LABEL_28;
            }
          }
          if (HasIvar != v19)
            goto LABEL_4;
        }
LABEL_28:
        ++v11;
      }
      while (v9 != v11);
      v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v9 = v28;
    }
    while (v28);
  }
  if (!-[NSMutableDictionary count](self->extensionMap_, "count") && !objc_msgSend(*((id *)a3 + 2), "count")
    || (v6 = -[NSMutableDictionary isEqual:](self->extensionMap_, "isEqual:", *((_QWORD *)a3 + 2))) != 0)
  {
    if ((v29 = (void *)*((_QWORD *)a3 + 1),
          !-[TRIPBUnknownFieldSet countOfFields](self->unknownFields_, "countOfFields"))
      && !objc_msgSend(v29, "countOfFields")
      || (v6 = -[TRIPBUnknownFieldSet isEqual:](self->unknownFields_, "isEqual:", v29)) != 0)
    {
LABEL_45:
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)_MergedGlobals_7;
  if (!_MergedGlobals_7)
  {
    qword_1ECF0E640 = -[TRIPBFileDescriptor initWithPackage:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:syntax:", CFSTR("internal"), 2);
    LODWORD(v3) = 0;
    result = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", objc_opt_class(), 0, qword_1ECF0E640, 0, 0, 0, v3);
    _MergedGlobals_7 = (uint64_t)result;
  }
  return result;
}

BOOL __38__TRIPBMessage_resolveInstanceMethod___block_invoke(uint64_t a1, uint64_t a2)
{
  return TRIPBGetHasIvar(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "parseFromData:extensionRegistry:error:", a3, 0, a4);
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a2 + 64);
  if (v2)
    v3 = *(void **)(v2 + *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  else
    v3 = 0;
  return objc_msgSend(v3, "count");
}

TRIPBAutocreatedArray *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  TRIPBAutocreatedArray *ArrayForField;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a2 + 64);
  if (!v4 || (ArrayForField = *(TRIPBAutocreatedArray **)(v4 + *(unsigned int *)(v3[1] + 24))) == 0)
  {
    TRIPBPrepareReadOnlySemaphore(a2);
    v6 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *(_QWORD *)(a2 + 64);
    if (!v7 || (ArrayForField = *(TRIPBAutocreatedArray **)(v7 + *(unsigned int *)(v3[1] + 24))) == 0)
    {
      ArrayForField = CreateArrayForField(v3, (TRIPBMessage *)a2);
      TRIPBSetAutocreatedRetainedObjectIvarWithField(a2, (uint64_t)v3, (uint64_t)ArrayForField);
    }
    v8 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_signal(v8);
  }
  return ArrayForField;
}

void *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_6(uint64_t a1, _QWORD *a2, void *a3)
{
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a2, *(_QWORD *)(a1 + 32), a3, *(unsigned __int8 *)(a1 + 40));
}

TRIPBAutocreatedDictionary *__38__TRIPBMessage_resolveInstanceMethod___block_invoke_5(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  TRIPBAutocreatedDictionary *MapForField;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a2 + 64);
  if (!v4 || (MapForField = *(TRIPBAutocreatedDictionary **)(v4 + *(unsigned int *)(v3[1] + 24))) == 0)
  {
    TRIPBPrepareReadOnlySemaphore(a2);
    v6 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = *(_QWORD *)(a2 + 64);
    if (!v7 || (MapForField = *(TRIPBAutocreatedDictionary **)(v7 + *(unsigned int *)(v3[1] + 24))) == 0)
    {
      MapForField = CreateMapForField(v3, (TRIPBMessage *)a2);
      TRIPBSetAutocreatedRetainedObjectIvarWithField(a2, (uint64_t)v3, (uint64_t)MapForField);
    }
    v8 = atomic_load((unint64_t *)(a2 + 56));
    dispatch_semaphore_signal(v8);
  }
  return MapForField;
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

- (TRIPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return -[TRIPBMessage initWithData:extensionRegistry:error:](self, "initWithData:extensionRegistry:error:", a3, 0, a4);
}

- (TRIPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  TRIPBMessage *v8;
  TRIPBMessage *v9;

  v8 = -[TRIPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TRIPBMessage mergeFromCodedInputStream:extensionRegistry:](v8, "mergeFromCodedInputStream:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
    if (!-[TRIPBMessage isInitialized](v9, "isInitialized"))
    {

      v9 = 0;
      if (a5)
        *a5 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBMessageErrorDomain"), -101, 0);
    }
  }
  return v9;
}

void __47__TRIPBMessage_copyFieldsInto_zone_descriptor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = (id)objc_msgSend(a3, "copyWithZone:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, a2);

}

- (void)clear
{
  -[TRIPBMessage internalClear:](self, "internalClear:", 1);
}

uint64_t __29__TRIPBMessage_isInitialized__block_invoke(uint64_t result, _QWORD *a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    v6 = result;
    if (objc_msgSend(a2, "isRepeated"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (!result)
        return result;
      v7 = result;
      v8 = *(_QWORD *)v11;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "isInitialized");
        if (!(_DWORD)result)
          break;
        if (v7 == ++v9)
        {
          result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          v7 = result;
          if (result)
            goto LABEL_5;
          return result;
        }
      }
    }
    else
    {
      result = objc_msgSend(a3, "isInitialized");
      if ((result & 1) != 0)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)data
{
  void *v3;
  TRIPBCodedOutputStream *v4;

  if (!-[TRIPBMessage isInitialized](self, "isInitialized"))
    return 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[TRIPBMessage serializedSize](self, "serializedSize"));
  v4 = -[TRIPBCodedOutputStream initWithData:]([TRIPBCodedOutputStream alloc], "initWithData:", v3);
  -[TRIPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

- (id)delimitedData
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  TRIPBCodedOutputStream *v8;

  v3 = -[TRIPBMessage serializedSize](self, "serializedSize");
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 < 0x80)
    v4 = 1;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v4 + v3);
  v8 = -[TRIPBCodedOutputStream initWithData:]([TRIPBCodedOutputStream alloc], "initWithData:", v7);
  -[TRIPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v8);

  return v7;
}

- (void)writeToOutputStream:(id)a3
{
  TRIPBCodedOutputStream *v4;

  v4 = -[TRIPBCodedOutputStream initWithOutputStream:]([TRIPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[TRIPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);
  -[TRIPBCodedOutputStream flush](v4, "flush");

}

- (void)writeToCodedOutputStream:(id)a3
{
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  TRIPBUnknownFieldSet *unknownFields;

  v5 = -[TRIPBMessage descriptor](self, "descriptor");
  v6 = (void *)v5[1];
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "extensionRanges");
  v9 = objc_msgSend(v5, "extensionRangesCount");
  if (v7)
    v10 = 0;
  else
    v10 = v9 == 0;
  if (!v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = v9;
    do
    {
      if (v12 == v7)
      {
        -[TRIPBMessage writeExtensionsToCodedOutputStream:range:](self, "writeExtensionsToCodedOutputStream:range:", a3, *(_QWORD *)(v8 + 8 * v11));
        v12 = v7;
        ++v11;
      }
      else if (v11 == v13
             || (v14 = objc_msgSend(v6, "objectAtIndexedSubscript:", v12),
                 v15 = (_QWORD *)(v8 + 8 * v11),
                 *(_DWORD *)(*(_QWORD *)(v14 + 8) + 16) < *(_DWORD *)v15))
      {
        -[TRIPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", objc_msgSend(v6, "objectAtIndexedSubscript:", v12++), a3);
      }
      else
      {
        ++v11;
        -[TRIPBMessage writeExtensionsToCodedOutputStream:range:](self, "writeExtensionsToCodedOutputStream:range:", a3, *v15);
      }
    }
    while (v12 < v7 || v11 < v13);
  }
  v16 = objc_msgSend(v5, "isWireFormat");
  unknownFields = self->unknownFields_;
  if ((v16 & 1) != 0)
    -[TRIPBUnknownFieldSet writeAsMessageSetTo:](unknownFields, "writeAsMessageSetTo:", a3);
  else
    -[TRIPBUnknownFieldSet writeToCodedOutputStream:](unknownFields, "writeToCodedOutputStream:", a3);
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  TRIPBCodedOutputStream *v4;

  v4 = -[TRIPBCodedOutputStream initWithOutputStream:]([TRIPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[TRIPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v4);
  -[TRIPBCodedOutputStream flush](v4, "flush");

}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  objc_msgSend(a3, "writeRawVarintSizeTAs32:", -[TRIPBMessage serializedSize](self, "serializedSize"));
  -[TRIPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", a3);
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  TRIPBMessage_Storage *v36;
  void *v37;
  TRIPBMessage_Storage *v38;
  TRIPBMessage_Storage *v39;
  TRIPBMessage_Storage *v40;
  uint64_t v41;
  int v42;
  double v43;
  TRIPBMessage_Storage *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  TRIPBMessage_Storage *messageStorage;
  uint64_t v61;
  TRIPBMessage_Storage *v62;
  uint64_t v63;
  TRIPBMessage_Storage *v64;
  uint64_t v65;
  TRIPBMessage_Storage *v66;
  uint64_t v67;
  TRIPBMessage_Storage *v68;
  uint64_t v69;
  TRIPBMessage_Storage *v70;
  uint64_t v71;
  TRIPBMessage_Storage *v72;
  uint64_t v73;
  TRIPBMessage_Storage *v74;
  uint64_t v75;
  TRIPBMessage_Storage *v76;
  uint64_t v77;
  TRIPBMessage_Storage *v78;
  uint64_t v79;
  TRIPBMessage_Storage *v80;
  uint64_t v81;
  TRIPBMessage_Storage *v82;
  uint64_t v83;
  TRIPBMessage_Storage *v84;
  uint64_t v85;
  TRIPBMessage_Storage *v86;
  uint64_t v87;

  v7 = objc_msgSend(a3, "fieldType");
  if (v7
    || TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(*((_QWORD *)a3 + 1) + 20), *(_DWORD *)(*((_QWORD *)a3 + 1) + 16)))
  {
    v8 = *((_QWORD *)a3 + 1);
    v9 = *(unsigned int *)(v8 + 16);
    switch(*(_BYTE *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v10 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v10 + 28) & 0xF04) != 0)
              v11 = 2;
            else
              v11 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v10 + 30)];
            v46 = v11 | (8 * *(_DWORD *)(v10 + 16));
          }
          else
          {
            v46 = 0;
          }
          messageStorage = self->messageStorage_;
          if (messageStorage)
            v61 = *(_QWORD *)((char *)messageStorage + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v61 = 0;
          objc_msgSend(a4, "writeBoolArray:values:tag:", v9, v61, v46);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeBool:value:", v9, TRIPBGetMessageBoolField((uint64_t)self, a3));
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v12 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v12 + 28) & 0xF04) != 0)
              v13 = 2;
            else
              v13 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v12 + 30)];
            v47 = v13 | (8 * *(_DWORD *)(v12 + 16));
          }
          else
          {
            v47 = 0;
          }
          v62 = self->messageStorage_;
          if (v62)
            v63 = *(_QWORD *)((char *)v62 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v63 = 0;
          objc_msgSend(a4, "writeFixed32Array:values:tag:", v9, v63, v47);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeFixed32:value:", v9, TRIPBGetMessageUInt32Field((uint64_t)self, a3));
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v14 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v14 + 28) & 0xF04) != 0)
              v15 = 2;
            else
              v15 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v14 + 30)];
            v48 = v15 | (8 * *(_DWORD *)(v14 + 16));
          }
          else
          {
            v48 = 0;
          }
          v64 = self->messageStorage_;
          if (v64)
            v65 = *(_QWORD *)((char *)v64 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v65 = 0;
          objc_msgSend(a4, "writeSFixed32Array:values:tag:", v9, v65, v48);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeSFixed32:value:", v9, TRIPBGetMessageInt32Field((uint64_t)self, a3));
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v16 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v16 + 28) & 0xF04) != 0)
              v17 = 2;
            else
              v17 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v16 + 30)];
            v49 = v17 | (8 * *(_DWORD *)(v16 + 16));
          }
          else
          {
            v49 = 0;
          }
          v66 = self->messageStorage_;
          if (v66)
            v67 = *(_QWORD *)((char *)v66 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v67 = 0;
          objc_msgSend(a4, "writeFloatArray:values:tag:", v9, v67, v49);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          *(float *)&v43 = TRIPBGetMessageFloatField((uint64_t)self, a3);
          objc_msgSend(a4, "writeFloat:value:", v9, v43);
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v18 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v18 + 28) & 0xF04) != 0)
              v19 = 2;
            else
              v19 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v18 + 30)];
            v50 = v19 | (8 * *(_DWORD *)(v18 + 16));
          }
          else
          {
            v50 = 0;
          }
          v68 = self->messageStorage_;
          if (v68)
            v69 = *(_QWORD *)((char *)v68 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v69 = 0;
          objc_msgSend(a4, "writeFixed64Array:values:tag:", v9, v69, v50);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeFixed64:value:", v9, TRIPBGetMessageUInt64Field((uint64_t)self, a3));
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v20 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v20 + 28) & 0xF04) != 0)
              v21 = 2;
            else
              v21 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v20 + 30)];
            v51 = v21 | (8 * *(_DWORD *)(v20 + 16));
          }
          else
          {
            v51 = 0;
          }
          v70 = self->messageStorage_;
          if (v70)
            v71 = *(_QWORD *)((char *)v70 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v71 = 0;
          objc_msgSend(a4, "writeSFixed64Array:values:tag:", v9, v71, v51);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeSFixed64:value:", v9, TRIPBGetMessageInt64Field((uint64_t)self, a3));
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v22 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v22 + 28) & 0xF04) != 0)
              v23 = 2;
            else
              v23 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v22 + 30)];
            v52 = v23 | (8 * *(_DWORD *)(v22 + 16));
          }
          else
          {
            v52 = 0;
          }
          v72 = self->messageStorage_;
          if (v72)
            v73 = *(_QWORD *)((char *)v72 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v73 = 0;
          objc_msgSend(a4, "writeDoubleArray:values:tag:", v9, v73, v52);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeDouble:value:", v9, TRIPBGetMessageDoubleField((uint64_t)self, a3));
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v24 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v24 + 28) & 0xF04) != 0)
              v25 = 2;
            else
              v25 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v24 + 30)];
            v53 = v25 | (8 * *(_DWORD *)(v24 + 16));
          }
          else
          {
            v53 = 0;
          }
          v74 = self->messageStorage_;
          if (v74)
            v75 = *(_QWORD *)((char *)v74 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v75 = 0;
          objc_msgSend(a4, "writeInt32Array:values:tag:", v9, v75, v53);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeInt32:value:", v9, TRIPBGetMessageInt32Field((uint64_t)self, a3));
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v26 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v26 + 28) & 0xF04) != 0)
              v27 = 2;
            else
              v27 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v26 + 30)];
            v54 = v27 | (8 * *(_DWORD *)(v26 + 16));
          }
          else
          {
            v54 = 0;
          }
          v76 = self->messageStorage_;
          if (v76)
            v77 = *(_QWORD *)((char *)v76 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v77 = 0;
          objc_msgSend(a4, "writeInt64Array:values:tag:", v9, v77, v54);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeInt64:value:", v9, TRIPBGetMessageInt64Field((uint64_t)self, a3));
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v28 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v28 + 28) & 0xF04) != 0)
              v29 = 2;
            else
              v29 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v28 + 30)];
            v55 = v29 | (8 * *(_DWORD *)(v28 + 16));
          }
          else
          {
            v55 = 0;
          }
          v78 = self->messageStorage_;
          if (v78)
            v79 = *(_QWORD *)((char *)v78 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v79 = 0;
          objc_msgSend(a4, "writeSInt32Array:values:tag:", v9, v79, v55);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeSInt32:value:", v9, TRIPBGetMessageInt32Field((uint64_t)self, a3));
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v30 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v30 + 28) & 0xF04) != 0)
              v31 = 2;
            else
              v31 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v30 + 30)];
            v56 = v31 | (8 * *(_DWORD *)(v30 + 16));
          }
          else
          {
            v56 = 0;
          }
          v80 = self->messageStorage_;
          if (v80)
            v81 = *(_QWORD *)((char *)v80 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v81 = 0;
          objc_msgSend(a4, "writeSInt64Array:values:tag:", v9, v81, v56);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeSInt64:value:", v9, TRIPBGetMessageInt64Field((uint64_t)self, a3));
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v32 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v32 + 28) & 0xF04) != 0)
              v33 = 2;
            else
              v33 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v32 + 30)];
            v57 = v33 | (8 * *(_DWORD *)(v32 + 16));
          }
          else
          {
            v57 = 0;
          }
          v82 = self->messageStorage_;
          if (v82)
            v83 = *(_QWORD *)((char *)v82 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v83 = 0;
          objc_msgSend(a4, "writeUInt32Array:values:tag:", v9, v83, v57);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeUInt32:value:", v9, TRIPBGetMessageUInt32Field((uint64_t)self, a3));
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v34 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v34 + 28) & 0xF04) != 0)
              v35 = 2;
            else
              v35 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v34 + 30)];
            v58 = v35 | (8 * *(_DWORD *)(v34 + 16));
          }
          else
          {
            v58 = 0;
          }
          v84 = self->messageStorage_;
          if (v84)
            v85 = *(_QWORD *)((char *)v84 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v85 = 0;
          objc_msgSend(a4, "writeUInt64Array:values:tag:", v9, v85, v58);
        }
        else
        {
          if (v7)
            goto LABEL_96;
          objc_msgSend(a4, "writeUInt64:value:", v9, TRIPBGetMessageUInt64Field((uint64_t)self, a3));
        }
        break;
      case 0xD:
        v36 = self->messageStorage_;
        if (v36)
          v37 = *(void **)((char *)v36 + *(unsigned int *)(v8 + 24));
        else
          v37 = 0;
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeBytesArray:values:", *(unsigned int *)(v8 + 16), v37);
        }
        else
        {
          if (v7)
            goto LABEL_118;
          objc_msgSend(a4, "writeBytes:value:", *(unsigned int *)(v8 + 16), v37);
        }
        break;
      case 0xE:
        v38 = self->messageStorage_;
        if (v38)
          v37 = *(void **)((char *)v38 + *(unsigned int *)(v8 + 24));
        else
          v37 = 0;
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeStringArray:values:", *(unsigned int *)(v8 + 16), v37);
        }
        else
        {
          if (v7)
            goto LABEL_118;
          objc_msgSend(a4, "writeString:value:", *(unsigned int *)(v8 + 16), v37);
        }
        break;
      case 0xF:
        v39 = self->messageStorage_;
        if (v39)
          v37 = *(void **)((char *)v39 + *(unsigned int *)(v8 + 24));
        else
          v37 = 0;
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeMessageArray:values:", *(unsigned int *)(v8 + 16), v37);
        }
        else
        {
          if (v7)
            goto LABEL_118;
          objc_msgSend(a4, "writeMessage:value:", *(unsigned int *)(v8 + 16), v37);
        }
        break;
      case 0x10:
        v40 = self->messageStorage_;
        if (v40)
          v37 = *(void **)((char *)v40 + *(unsigned int *)(v8 + 24));
        else
          v37 = 0;
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeGroupArray:values:", *(unsigned int *)(v8 + 16), v37);
        }
        else if (v7)
        {
LABEL_118:
          if (objc_msgSend(a3, "mapKeyDataType") != 14)
          {
            v45 = v37;
            goto LABEL_121;
          }
          TRIPBDictionaryWriteToStreamInternalHelper(a4, v37, a3);
        }
        else
        {
          objc_msgSend(a4, "writeGroup:value:", *(unsigned int *)(v8 + 16), v37);
        }
        break;
      case 0x11:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
          {
            v41 = *((_QWORD *)a3 + 1);
            if ((*(_WORD *)(v41 + 28) & 0xF04) != 0)
              v42 = 2;
            else
              v42 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v41 + 30)];
            v59 = v42 | (8 * *(_DWORD *)(v41 + 16));
          }
          else
          {
            v59 = 0;
          }
          v86 = self->messageStorage_;
          if (v86)
            v87 = *(_QWORD *)((char *)v86 + *(unsigned int *)(*((_QWORD *)a3 + 1) + 24));
          else
            v87 = 0;
          objc_msgSend(a4, "writeEnumArray:values:tag:", v9, v87, v59);
        }
        else if (v7)
        {
LABEL_96:
          v44 = self->messageStorage_;
          if (v44)
            v45 = *(void **)((char *)v44 + *(unsigned int *)(v8 + 24));
          else
            v45 = 0;
LABEL_121:
          objc_msgSend(v45, "writeToCodedOutputStream:asField:", a4, a3);
        }
        else
        {
          objc_msgSend(a4, "writeEnum:value:", v9, TRIPBGetMessageInt32Field((uint64_t)self, a3));
        }
        break;
      default:
        return;
    }
  }
}

- (id)getExtension:(id)a3
{
  _QWORD *v5;
  NSObject *v6;
  NSMutableDictionary *autocreatedExtensionMap;
  NSObject *v8;

  CheckExtension((uint64_t)self, a3);
  v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
  if (v5)
    return v5;
  if ((objc_msgSend(a3, "isRepeated") & 1) != 0)
    return 0;
  if (*(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 44) - 15 < 2)
  {
    TRIPBPrepareReadOnlySemaphore((uint64_t)self);
    v6 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v5 = (_QWORD *)-[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
    if (!v5)
    {
      v5 = objc_alloc_init((Class)objc_msgSend(a3, "msgClass"));
      v5[4] = self;
      v5[6] = a3;
      autocreatedExtensionMap = self->autocreatedExtensionMap_;
      if (!autocreatedExtensionMap)
      {
        autocreatedExtensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->autocreatedExtensionMap_ = autocreatedExtensionMap;
      }
      -[NSMutableDictionary setObject:forKey:](autocreatedExtensionMap, "setObject:forKey:", v5, a3);

    }
    v8 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_signal(v8);
    return v5;
  }
  return (id)objc_msgSend(a3, "defaultValue");
}

- (id)getExistingExtension:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
}

- (BOOL)hasExtension:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3) != 0;
}

- (id)extensionsCurrentlySet
{
  NSMutableDictionary *extensionMap;

  extensionMap = self->extensionMap_;
  if (extensionMap)
    return (id)-[NSMutableDictionary allKeys](extensionMap, "allKeys");
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TRIPBExtensionRange)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)-[NSMutableDictionary allKeys](self->extensionMap_, "allKeys"), "sortedArrayUsingSelector:", sel_compareByFieldNumber_);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "fieldNumber");
        if (v13 >= a4.var0 && v13 < a4.var1)
          TRIPBWriteExtensionValueToOutputStream((uint64_t)v12, (void *)-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v12), a3);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
}

- (void)setExtension:(id)a3 value:(id)a4
{
  NSMutableDictionary *extensionMap;
  id v8;

  if (a4)
  {
    CheckExtension((uint64_t)self, a3);
    if (objc_msgSend(a3, "isRepeated"))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must call addExtension() for repeated types."));
    extensionMap = self->extensionMap_;
    if (!extensionMap)
    {
      extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->extensionMap_ = extensionMap;
    }
    -[NSMutableDictionary setObject:forKey:](extensionMap, "setObject:forKey:", a4, a3);
    if (*(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 44) - 15 <= 1
      && (objc_msgSend(a3, "isRepeated") & 1) == 0)
    {
      v8 = (id)-[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->autocreatedExtensionMap_, "removeObjectForKey:", a3);
      TRIPBClearMessageAutocreator((uint64_t)v8);

    }
    TRIPBBecomeVisibleToAutocreator(self);
  }
  else
  {
    -[TRIPBMessage clearExtension:](self, "clearExtension:", a3);
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  NSMutableDictionary *extensionMap;
  void *v8;

  CheckExtension((uint64_t)self, a3);
  if ((objc_msgSend(a3, "isRepeated") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must call setExtension() for singular types."));
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->extensionMap_ = extensionMap;
  }
  v8 = (void *)-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3);
  if (!v8)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v8, a3);
  }
  objc_msgSend(v8, "addObject:", a4);
  TRIPBBecomeVisibleToAutocreator(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  NSMutableDictionary *extensionMap;

  CheckExtension((uint64_t)self, a3);
  if ((objc_msgSend(a3, "isRepeated") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must call setExtension() for singular types."));
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->extensionMap_ = extensionMap;
  }
  objc_msgSend((id)-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3), "replaceObjectAtIndex:withObject:", a4, a5);
  TRIPBBecomeVisibleToAutocreator(self);
}

- (void)clearExtension:(id)a3
{
  CheckExtension((uint64_t)self, a3);
  if (-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3))
  {
    -[NSMutableDictionary removeObjectForKey:](self->extensionMap_, "removeObjectForKey:", a3);
    TRIPBBecomeVisibleToAutocreator(self);
  }
}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t v4;
  uint64_t RetainedBytesNoCopy;
  id v8;

  v4 = *((_QWORD *)a3 + 3);
  if (v4 != *((_QWORD *)a3 + 2) && v4 != *((_QWORD *)a3 + 4))
  {
    RetainedBytesNoCopy = TRIPBCodedInputStreamReadRetainedBytesNoCopy((uint64_t *)a3 + 1);
    if (RetainedBytesNoCopy)
    {
      v8 = (id)RetainedBytesNoCopy;
      -[TRIPBMessage mergeFromData:extensionRegistry:](self, "mergeFromData:extensionRegistry:", RetainedBytesNoCopy, a4);

    }
  }
}

+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCodedInputStream:extensionRegistry:error:", a3, a4, a5);
}

+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v8;
  int v9;
  char v10;
  id result;
  void *v12;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "mergeDelimitedFromCodedInputStream:extensionRegistry:", a3, a4);
  if (a5)
    *a5 = 0;
  if (!v8)
    return 0;
  v9 = objc_msgSend(v8, "isInitialized");
  v10 = v9;
  if (v9)
    result = v8;
  else
    result = 0;
  if (a5)
  {
    if ((v10 & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBMessageErrorDomain"), -101, 0);
      result = 0;
      *a5 = v12;
    }
  }
  return result;
}

- (TRIPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  TRIPBUnknownFieldSet *unknownFields;

  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (TRIPBUnknownFieldSet *)objc_msgSend(a3, "copy");
    TRIPBBecomeVisibleToAutocreator(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  _QWORD *v7;
  id v8;
  uint64_t RawVarint64;
  uint64_t *v10;
  uint64_t v11;
  uint64_t Tag;
  TRIPBCodedInputStream *v13;

  v7 = 0;
  v8 = 0;
  RawVarint64 = 0;
  v10 = (uint64_t *)((char *)a3 + 8);
LABEL_2:
  v11 = RawVarint64;
  while (1)
  {
    Tag = TRIPBCodedInputStreamReadTag((uint64_t)v10);
    if (!(_DWORD)Tag)
      break;
    if ((_DWORD)Tag == 26)
    {
      v8 = (id)TRIPBCodedInputStreamReadRetainedBytesNoCopy(v10);
    }
    else if ((_DWORD)Tag == 16)
    {
      RawVarint64 = ReadRawVarint64(v10);
      v11 = 0;
      if ((_DWORD)RawVarint64)
      {
        v7 = (_QWORD *)objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", -[TRIPBMessage descriptor](self, "descriptor"), RawVarint64);
        goto LABEL_2;
      }
    }
    else if ((objc_msgSend(a3, "skipField:", Tag) & 1) == 0)
    {
      break;
    }
  }
  objc_msgSend(a3, "checkLastTagWas:", 12);
  if (v8 && (_DWORD)v11)
  {
    if (v7)
    {
      v13 = -[TRIPBCodedInputStream initWithData:]([TRIPBCodedInputStream alloc], "initWithData:", v8);
      TRIPBExtensionMergeFromInputStream(v7, objc_msgSend(v7, "isPackable"), (uint64_t *)v13, (uint64_t)a4, self);

    }
    else
    {
      objc_msgSend((id)GetOrMakeUnknownFields(self), "mergeMessageSetMessage:data:", v11, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v8));
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  int v13;
  int v14;
  int v15;

  v5 = *(_QWORD *)&a5;
  v9 = a5 >> 3;
  v10 = -[TRIPBMessage descriptor](self, "descriptor");
  v11 = (_QWORD *)objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", v10, v9);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "wireType") == (v5 & 7))
    {
      v13 = objc_msgSend(v12, "isPackable");
LABEL_4:
      TRIPBExtensionMergeFromInputStream(v12, v13, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if (objc_msgSend(v12, "isRepeated")
      && *(unsigned __int8 *)(v12[1] + 44) - 13 >= 4
      && objc_msgSend(v12, "alternateWireType") == (v5 & 7))
    {
      v13 = objc_msgSend(v12, "isPackable") ^ 1;
      goto LABEL_4;
    }
  }
  else
  {
    v14 = objc_msgSend(v10, "isWireFormat");
    if ((_DWORD)v5 == 11 && v14)
    {
      -[TRIPBMessage parseMessageSet:extensionRegistry:](self, "parseMessageSet:extensionRegistry:", a3, a4);
      goto LABEL_8;
    }
  }
  v15 = +[TRIPBUnknownFieldSet isFieldTag:](TRIPBUnknownFieldSet, "isFieldTag:", v5);
  if (v15)
    LOBYTE(v15) = objc_msgSend((id)GetOrMakeUnknownFields(self), "mergeFieldFrom:input:", v5, a3);
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend((id)GetOrMakeUnknownFields(self), "addUnknownMapEntry:value:", *(_QWORD *)&a3, a4);
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  void *v6;
  _QWORD *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  TRIPBAutocreatedArray *ArrayIvarWithField;
  TRIPBAutocreatedDictionary *MapIvarWithField;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _BOOL4 v38;
  float v39;
  double v40;
  TRIPBMessage *v41;
  id v42;
  TRIPBMessage_Storage *messageStorage;
  void *v44;
  TRIPBMessage *v45;
  TRIPBUnknownFieldSet *unknownFields;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  _QWORD *v52;
  void *v53;
  id v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  id obja;
  TRIPBMessage *v68;
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
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isSubclassOfClass:", v6) & 1) == 0 && (objc_msgSend(v6, "isSubclassOfClass:", v5) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Classes must match %@ != %@"), v5, v6);
  TRIPBBecomeVisibleToAutocreator(self);
  v68 = self;
  v7 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "descriptor");
  v8 = objc_msgSend((id)objc_msgSend(v7, "file"), "syntax");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v9 = (void *)v7[1];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v78 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD **)(*((_QWORD *)&v77 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "fieldType");
        if (v15 == 1)
        {
          v21 = *((_QWORD *)a3 + 8);
          if (v21)
          {
            v22 = v14[1];
            v23 = *(_QWORD *)(v21 + *(unsigned int *)(v22 + 24));
            if (v23)
            {
              v24 = *(unsigned __int8 *)(v22 + 30);
              if ((v24 - 13) > 3)
              {
                ArrayIvarWithField = GetOrCreateArrayIvarWithField(v68, v14, v8);
                if (v24 == 17)
                  -[TRIPBAutocreatedArray addRawValuesFromArray:](ArrayIvarWithField, "addRawValuesFromArray:", v23);
                else
                  -[TRIPBAutocreatedArray addValuesFromArray:](ArrayIvarWithField, "addValuesFromArray:", v23);
              }
              else
              {
                -[TRIPBAutocreatedArray addObjectsFromArray:](GetOrCreateArrayIvarWithField(v68, v14, v8), "addObjectsFromArray:", v23);
              }
            }
          }
        }
        else if (v15)
        {
          v25 = *((_QWORD *)a3 + 8);
          if (v25)
          {
            v26 = *(_QWORD *)(v25 + *(unsigned int *)(v14[1] + 24));
            if (v26)
            {
              v27 = objc_msgSend(v14, "mapKeyDataType");
              v28 = *(unsigned __int8 *)(v14[1] + 30);
              if ((v27 - 13) > 3 || (v28 - 13) > 3)
              {
                MapIvarWithField = GetOrCreateMapIvarWithField(v68, v14, v8);
                if (v28 == 17)
                {
                  -[TRIPBAutocreatedDictionary addRawEntriesFromDictionary:](MapIvarWithField, "addRawEntriesFromDictionary:", v26);
                  continue;
                }
              }
              else
              {
                MapIvarWithField = GetOrCreateMapIvarWithField(v68, v14, v8);
              }
              -[TRIPBAutocreatedDictionary addEntriesFromDictionary:](MapIvarWithField, "addEntriesFromDictionary:", v26);
            }
          }
        }
        else
        {
          v16 = v14[1];
          v18 = *(_DWORD *)(v16 + 16);
          v17 = *(_DWORD *)(v16 + 20);
          if (TRIPBGetHasIvar((uint64_t)a3, v17, v18))
          {
            v19 = v14[1];
            switch(*(_BYTE *)(v19 + 30))
            {
              case 0:
                v38 = TRIPBGetMessageBoolField((uint64_t)a3, v14);
                TRIPBSetBoolIvarWithFieldInternal(v68, (uint64_t)v14, v38, v8);
                break;
              case 1:
              case 0xB:
                v33 = TRIPBGetMessageUInt32Field((uint64_t)a3, v14);
                TRIPBSetUInt32IvarWithFieldInternal(v68, (uint64_t)v14, v33, v8);
                break;
              case 2:
              case 7:
              case 9:
              case 0x11:
                v20 = TRIPBGetMessageInt32Field((uint64_t)a3, v14);
                TRIPBSetInt32IvarWithFieldInternal(v68, (uint64_t)v14, v20, v8);
                break;
              case 3:
                v39 = TRIPBGetMessageFloatField((uint64_t)a3, v14);
                TRIPBSetFloatIvarWithFieldInternal(v68, (uint64_t)v14, v8, v39);
                break;
              case 4:
              case 0xC:
                v34 = TRIPBGetMessageUInt64Field((uint64_t)a3, v14);
                TRIPBSetUInt64IvarWithFieldInternal(v68, (uint64_t)v14, v34, v8);
                break;
              case 5:
              case 8:
              case 0xA:
                v32 = TRIPBGetMessageInt64Field((uint64_t)a3, v14);
                TRIPBSetInt64IvarWithFieldInternal(v68, (uint64_t)v14, v32, v8);
                break;
              case 6:
                v40 = TRIPBGetMessageDoubleField((uint64_t)a3, v14);
                TRIPBSetDoubleIvarWithFieldInternal(v68, (uint64_t)v14, v8, v40);
                break;
              case 0xD:
              case 0xE:
                v35 = *((_QWORD *)a3 + 8);
                if (v35)
                  v36 = *(void **)(v35 + *(unsigned int *)(v19 + 24));
                else
                  v36 = 0;
                v41 = v68;
                v42 = v36;
                goto LABEL_48;
              case 0xF:
              case 0x10:
                v37 = *((_QWORD *)a3 + 8);
                if (v37)
                  obj = *(id *)(v37 + *(unsigned int *)(v19 + 24));
                else
                  obj = 0;
                v41 = v68;
                if (TRIPBGetHasIvar((uint64_t)v68, v17, v18))
                {
                  messageStorage = v68->messageStorage_;
                  if (messageStorage)
                    v44 = *(void **)((char *)messageStorage + *(unsigned int *)(v14[1] + 24));
                  else
                    v44 = 0;
                  objc_msgSend(v44, "mergeFrom:", obj);
                }
                else
                {
                  v42 = (id)objc_msgSend(obj, "copy");
LABEL_48:
                  TRIPBSetRetainedObjectIvarWithFieldInternal(v41, (uint64_t)v14, v42, v8);
                }
                break;
              default:
                continue;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v11);
  }
  v45 = v68;
  unknownFields = v68->unknownFields_;
  v47 = objc_msgSend(a3, "unknownFields");
  if (unknownFields)
    -[TRIPBUnknownFieldSet mergeUnknownFields:](unknownFields, "mergeUnknownFields:", v47);
  else
    -[TRIPBMessage setUnknownFields:](v68, "setUnknownFields:", v47);
  if (objc_msgSend(*((id *)a3 + 2), "count"))
  {
    if (!v68->extensionMap_)
    {
      v63 = (void *)*((_QWORD *)a3 + 2);
      v64 = MEMORY[0x194023134](v68);
      v68->extensionMap_ = (NSMutableDictionary *)CloneExtensionMap(v63, v64);
      return;
    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obja = (id)*((_QWORD *)a3 + 2);
    v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (!v48)
      return;
    v49 = v48;
    v50 = *(_QWORD *)v74;
    v65 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v74 != v50)
          objc_enumerationMutation(obja);
        v52 = *(_QWORD **)(*((_QWORD *)&v73 + 1) + 8 * j);
        v53 = (void *)objc_msgSend(*((id *)a3 + 2), "objectForKey:", v52);
        v54 = (id)-[NSMutableDictionary objectForKey:](v45->extensionMap_, "objectForKey:", v52);
        v55 = *(unsigned __int8 *)(v52[1] + 44) - 15;
        if (objc_msgSend(v52, "isRepeated"))
        {
          if (!v54)
          {
            v54 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSMutableDictionary setObject:forKey:](v45->extensionMap_, "setObject:forKey:", v54, v52);

          }
          if (v55 > 1)
          {
            objc_msgSend(v54, "addObjectsFromArray:", v53);
            continue;
          }
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v70;
            do
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v70 != v58)
                  objc_enumerationMutation(v53);
                v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * k), "copy");
                objc_msgSend(v54, "addObject:", v60);

              }
              v57 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
            }
            while (v57);
          }
        }
        else
        {
          if (v55 > 1)
          {
            -[NSMutableDictionary setObject:forKey:](v45->extensionMap_, "setObject:forKey:", v53, v52);
            continue;
          }
          if (v54)
          {
            objc_msgSend(v54, "mergeFrom:", v53);
          }
          else
          {
            v61 = (void *)objc_msgSend(v53, "copy");
            -[NSMutableDictionary setObject:forKey:](v45->extensionMap_, "setObject:forKey:", v61, v52);

          }
        }
        v45 = v68;
        v50 = v65;
        if ((objc_msgSend(v52, "isRepeated") & 1) == 0)
        {
          v62 = (id)-[NSMutableDictionary objectForKey:](v68->autocreatedExtensionMap_, "objectForKey:", v52);
          -[NSMutableDictionary removeObjectForKey:](v68->autocreatedExtensionMap_, "removeObjectForKey:", v52);
          TRIPBClearMessageAutocreator((uint64_t)v62);

        }
      }
      v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    }
    while (v49);
  }
}

- (unint64_t)hash
{
  unint64_t v3;
  TRIPBMessage_Storage *messageStorage;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  TRIPBMessage_Storage *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "descriptor");
  messageStorage = self->messageStorage_;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *(void **)(v3 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = *(_QWORD *)(v10 + 8);
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0)
        {
          v12 = self->messageStorage_;
          if (v12)
            v13 = *(void **)((char *)v12 + *(unsigned int *)(v11 + 24));
          else
            v13 = 0;
          v17 = objc_msgSend(v13, "count");
          if (v17)
            v3 = v17 + 19 * (*(unsigned int *)(*(_QWORD *)(v10 + 8) + 16) + 19 * v3);
        }
        else if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v11 + 20), *(_DWORD *)(v11 + 16)))
        {
          v14 = *(_QWORD *)(v10 + 8);
          v15 = *(unsigned int *)(v14 + 24);
          switch(*(_BYTE *)(v14 + 30))
          {
            case 0:
              v3 = 19 * v3 + TRIPBGetHasIvar((uint64_t)self, v15, 0);
              continue;
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 0xB:
            case 0x11:
              v16 = *(unsigned int *)((char *)messageStorage + v15);
              goto LABEL_16;
            case 4:
            case 5:
            case 6:
            case 8:
            case 0xA:
            case 0xC:
              v16 = *(_QWORD *)((char *)messageStorage + v15);
LABEL_16:
              v3 = v16 + 19 * v3;
              continue;
            case 0xD:
            case 0xE:
              v18 = objc_msgSend(*(id *)((char *)messageStorage + v15), "hash");
              goto LABEL_19;
            case 0xF:
            case 0x10:
              v3 = *(unsigned int *)(v14 + 16) + 19 * v3;
              v18 = objc_msgSend((id)objc_opt_class(), "descriptor");
LABEL_19:
              v3 = v18 + 19 * v3;
              break;
            default:
              continue;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  return v3;
}

- (id)description
{
  __CFString *v3;

  v3 = TRIPBTextFormatForMessage(self, CFSTR("    "));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>: {\n%@}"), objc_opt_class(), self, v3);
}

- (unint64_t)serializedSize
{
  uint64_t v3;
  uint64_t i;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  TRIPBMessage_Storage *messageStorage;
  void *v15;
  TRIPBMessage_Storage *v16;
  void *v17;
  uint64_t v18;
  TRIPBMessage_Storage *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  unsigned int v56;
  unint64_t v57;
  TRIPBMessage_Storage *v58;
  void *v59;
  TRIPBMessage_Storage *v60;
  void *v61;
  TRIPBMessage_Storage *v62;
  void *v63;
  TRIPBMessage_Storage *v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  BOOL v72;
  uint64_t v73;
  int v74;
  TRIPBUnknownFieldSet *unknownFields;
  uint64_t v76;
  uint64_t v77;
  NSMutableDictionary *extensionMap;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t ii;
  _QWORD *v84;
  TRIPBMessage *v85;
  uint64_t v86;
  uint64_t v87;
  id obj;
  int v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[5];
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[5];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[5];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[5];
  uint64_t v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v84 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "descriptor");
  obj = (id)v84[1];
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
  if (!v91)
  {
    v3 = 0;
    goto LABEL_201;
  }
  v3 = 0;
  v90 = *(_QWORD *)v131;
  v85 = self;
  do
  {
    for (i = 0; i != v91; ++i)
    {
      if (*(_QWORD *)v131 != v90)
        objc_enumerationMutation(obj);
      v5 = *(_QWORD **)(*((_QWORD *)&v130 + 1) + 8 * i);
      v6 = objc_msgSend(v5, "fieldType");
      v7 = v5[1];
      v8 = *(unsigned __int8 *)(v7 + 30);
      if (v6 == 1)
      {
        messageStorage = self->messageStorage_;
        if (messageStorage)
          v15 = *(void **)((char *)messageStorage + *(unsigned int *)(v7 + 24));
        else
          v15 = 0;
        v21 = objc_msgSend(v15, "count");
        if (v21)
        {
          v86 = v21;
          v87 = v3;
          v126 = 0;
          v127 = &v126;
          v128 = 0x2020000000;
          v129 = 0;
          v89 = v8;
          switch(v8)
          {
            case 0:
              v125[0] = MEMORY[0x1E0C809B0];
              v125[1] = 3221225472;
              v125[2] = __30__TRIPBMessage_serializedSize__block_invoke;
              v125[3] = &unk_1E2E9B938;
              v125[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v125);
              break;
            case 1:
              v124[0] = MEMORY[0x1E0C809B0];
              v124[1] = 3221225472;
              v124[2] = __30__TRIPBMessage_serializedSize__block_invoke_2;
              v124[3] = &unk_1E2E9B910;
              v124[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v124);
              break;
            case 2:
              v123[0] = MEMORY[0x1E0C809B0];
              v123[1] = 3221225472;
              v123[2] = __30__TRIPBMessage_serializedSize__block_invoke_3;
              v123[3] = &unk_1E2E9B8E8;
              v123[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v123);
              break;
            case 3:
              v122[0] = MEMORY[0x1E0C809B0];
              v122[1] = 3221225472;
              v122[2] = __30__TRIPBMessage_serializedSize__block_invoke_4;
              v122[3] = &unk_1E2E9B870;
              v122[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v122);
              break;
            case 4:
              v121[0] = MEMORY[0x1E0C809B0];
              v121[1] = 3221225472;
              v121[2] = __30__TRIPBMessage_serializedSize__block_invoke_5;
              v121[3] = &unk_1E2E9B898;
              v121[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v121);
              break;
            case 5:
              v120[0] = MEMORY[0x1E0C809B0];
              v120[1] = 3221225472;
              v120[2] = __30__TRIPBMessage_serializedSize__block_invoke_6;
              v120[3] = &unk_1E2E9B8C0;
              v120[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v120);
              break;
            case 6:
              v119[0] = MEMORY[0x1E0C809B0];
              v119[1] = 3221225472;
              v119[2] = __30__TRIPBMessage_serializedSize__block_invoke_7;
              v119[3] = &unk_1E2E9B848;
              v119[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v119);
              break;
            case 7:
              v118[0] = MEMORY[0x1E0C809B0];
              v118[1] = 3221225472;
              v118[2] = __30__TRIPBMessage_serializedSize__block_invoke_8;
              v118[3] = &unk_1E2E9B8E8;
              v118[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v118);
              break;
            case 8:
              v117[0] = MEMORY[0x1E0C809B0];
              v117[1] = 3221225472;
              v117[2] = __30__TRIPBMessage_serializedSize__block_invoke_9;
              v117[3] = &unk_1E2E9B8C0;
              v117[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v117);
              break;
            case 9:
              v116[0] = MEMORY[0x1E0C809B0];
              v116[1] = 3221225472;
              v116[2] = __30__TRIPBMessage_serializedSize__block_invoke_10;
              v116[3] = &unk_1E2E9B8E8;
              v116[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v116);
              break;
            case 10:
              v115[0] = MEMORY[0x1E0C809B0];
              v115[1] = 3221225472;
              v115[2] = __30__TRIPBMessage_serializedSize__block_invoke_11;
              v115[3] = &unk_1E2E9B8C0;
              v115[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v115);
              break;
            case 11:
              v114[0] = MEMORY[0x1E0C809B0];
              v114[1] = 3221225472;
              v114[2] = __30__TRIPBMessage_serializedSize__block_invoke_12;
              v114[3] = &unk_1E2E9B910;
              v114[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v114);
              break;
            case 12:
              v113[0] = MEMORY[0x1E0C809B0];
              v113[1] = 3221225472;
              v113[2] = __30__TRIPBMessage_serializedSize__block_invoke_13;
              v113[3] = &unk_1E2E9B898;
              v113[4] = &v126;
              objc_msgSend(v15, "enumerateValuesWithBlock:", v113);
              break;
            case 13:
              v111 = 0u;
              v112 = 0u;
              v109 = 0u;
              v110 = 0u;
              v31 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
              if (v31)
              {
                v32 = *(_QWORD *)v110;
                do
                {
                  for (j = 0; j != v31; ++j)
                  {
                    if (*(_QWORD *)v110 != v32)
                      objc_enumerationMutation(v15);
                    v34 = objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * j), "length");
                    if (v34 >> 28)
                      v35 = 5;
                    else
                      v35 = 4;
                    if (v34 < 0x200000)
                      v35 = 3;
                    if (v34 < 0x4000)
                      v35 = 2;
                    if (v34 < 0x80)
                      v35 = 1;
                    v127[3] += v35 + v34;
                  }
                  v31 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v109, v138, 16);
                }
                while (v31);
              }
              break;
            case 14:
              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v106;
                do
                {
                  for (k = 0; k != v22; ++k)
                  {
                    if (*(_QWORD *)v106 != v23)
                      objc_enumerationMutation(v15);
                    v25 = objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * k), "lengthOfBytesUsingEncoding:", 4);
                    if (v25 >> 28)
                      v26 = 5;
                    else
                      v26 = 4;
                    if (v25 < 0x200000)
                      v26 = 3;
                    if (v25 < 0x4000)
                      v26 = 2;
                    if (v25 < 0x80)
                      v26 = 1;
                    v127[3] += v26 + v25;
                  }
                  v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v137, 16);
                }
                while (v22);
              }
              break;
            case 15:
              v103 = 0u;
              v104 = 0u;
              v101 = 0u;
              v102 = 0u;
              v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
              if (v36)
              {
                v37 = *(_QWORD *)v102;
                do
                {
                  for (m = 0; m != v36; ++m)
                  {
                    if (*(_QWORD *)v102 != v37)
                      objc_enumerationMutation(v15);
                    v39 = objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * m), "serializedSize");
                    if (v39 >> 28)
                      v40 = 5;
                    else
                      v40 = 4;
                    if (v39 < 0x200000)
                      v40 = 3;
                    if (v39 < 0x4000)
                      v40 = 2;
                    if (v39 < 0x80)
                      v40 = 1;
                    v127[3] += v40 + v39;
                  }
                  v36 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v101, v136, 16);
                }
                while (v36);
              }
              break;
            case 16:
              v99 = 0u;
              v100 = 0u;
              v97 = 0u;
              v98 = 0u;
              v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v97, v135, 16);
              if (v27)
              {
                v28 = *(_QWORD *)v98;
                do
                {
                  for (n = 0; n != v27; ++n)
                  {
                    if (*(_QWORD *)v98 != v28)
                      objc_enumerationMutation(v15);
                    v30 = objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * n), "serializedSize");
                    v127[3] += v30;
                  }
                  v27 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v97, v135, 16);
                }
                while (v27);
              }
              break;
            case 17:
              v96[0] = MEMORY[0x1E0C809B0];
              v96[1] = 3221225472;
              v96[2] = __30__TRIPBMessage_serializedSize__block_invoke_14;
              v96[3] = &unk_1E2E9B8E8;
              v96[4] = &v126;
              objc_msgSend(v15, "enumerateRawValuesWithBlock:", v96);
              break;
            default:
              break;
          }
          v41 = v127[3];
          v42 = 8 * *(_DWORD *)(v5[1] + 16);
          if (v42 >> 28)
            v43 = 5;
          else
            v43 = 4;
          if (v42 < 0x200000)
            v43 = 3;
          if (v42 < 0x4000)
            v43 = 2;
          if (v42 >= 0x80)
            v44 = v43;
          else
            v44 = 1;
          v45 = objc_msgSend(v5, "isPackable");
          v46 = v41 + v87;
          v47 = v44 << (v89 == 16);
          if (v45)
          {
            v48 = v47 + v46;
            v49 = *((_DWORD *)v127 + 6);
            if (v49 >> 28)
              v50 = 5;
            else
              v50 = 4;
            if (v49 < 0x200000)
              v50 = 3;
            if (v49 < 0x4000)
              v50 = 2;
            if (v49 < 0x80)
              v50 = 1;
            v72 = (v49 & 0x80000000) == 0;
            v51 = 10;
            if (v72)
              v51 = v50;
            v3 = v48 + v51;
          }
          else
          {
            v3 = v46 + v47 * v86;
          }
          self = v85;
          _Block_object_dispose(&v126, 8);
        }
      }
      else if (v6)
      {
        if ((v8 - 13) > 3 || objc_msgSend(v5, "mapKeyDataType") != 14)
        {
          v19 = self->messageStorage_;
          if (v19)
            v20 = *(void **)((char *)v19 + *(unsigned int *)(v5[1] + 24));
          else
            v20 = 0;
          v18 = objc_msgSend(v20, "computeSerializedSizeAsField:", v5);
          goto LABEL_27;
        }
        v16 = self->messageStorage_;
        if (v16)
        {
          v17 = *(void **)((char *)v16 + *(unsigned int *)(v5[1] + 24));
          if (v17)
          {
            v18 = TRIPBDictionaryComputeSizeInternalHelper(v17, (uint64_t)v5);
LABEL_27:
            v3 += v18;
            continue;
          }
        }
      }
      else if (TRIPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16)))
      {
        v10 = v8;
        v9 = v5[1];
        v11 = *(_DWORD *)(v9 + 16);
        switch(v10)
        {
          case 0:
            TRIPBGetMessageBoolField((uint64_t)self, v5);
            v12 = 8 * v11;
            if ((8 * v11) < 0x80)
            {
              v13 = 2;
              goto LABEL_196;
            }
            if (v12 < 0x4000)
            {
              v13 = 3;
              goto LABEL_196;
            }
            if (v12 < 0x200000)
            {
              v13 = 4;
              goto LABEL_196;
            }
            v72 = v12 >> 28 == 0;
            v13 = 5;
            goto LABEL_194;
          case 1:
            TRIPBGetMessageUInt32Field((uint64_t)self, v5);
            goto LABEL_129;
          case 2:
            TRIPBGetMessageInt32Field((uint64_t)self, v5);
            goto LABEL_129;
          case 3:
            TRIPBGetMessageFloatField((uint64_t)self, v5);
LABEL_129:
            v52 = 8 * v11;
            if ((8 * v11) < 0x80)
            {
              v13 = 5;
              goto LABEL_196;
            }
            if (v52 < 0x4000)
            {
              v13 = 6;
              goto LABEL_196;
            }
            if (v52 < 0x200000)
            {
              v13 = 7;
              goto LABEL_196;
            }
            v72 = v52 >> 28 == 0;
            v13 = 8;
            goto LABEL_194;
          case 4:
            TRIPBGetMessageUInt64Field((uint64_t)self, v5);
            goto LABEL_136;
          case 5:
            TRIPBGetMessageInt64Field((uint64_t)self, v5);
            goto LABEL_136;
          case 6:
            TRIPBGetMessageDoubleField((uint64_t)self, v5);
LABEL_136:
            v53 = 8 * v11;
            if ((8 * v11) >= 0x80)
            {
              if (v53 >= 0x4000)
              {
                if (v53 >= 0x200000)
                {
                  v72 = v53 >> 28 == 0;
                  v13 = 12;
LABEL_194:
                  if (!v72)
                    ++v13;
                }
                else
                {
                  v13 = 11;
                }
              }
              else
              {
                v13 = 10;
              }
            }
            else
            {
              v13 = 9;
            }
LABEL_196:
            v3 += v13;
            break;
          case 7:
            v54 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            v18 = TRIPBComputeInt32Size(v11, v54);
            goto LABEL_27;
          case 8:
            v57 = TRIPBGetMessageInt64Field((uint64_t)self, v5);
            goto LABEL_154;
          case 9:
            v55 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            v18 = TRIPBComputeSInt32Size(v11, v55);
            goto LABEL_27;
          case 10:
            v70 = TRIPBGetMessageInt64Field((uint64_t)self, v5);
            v18 = TRIPBComputeSInt64Size(v11, v70);
            goto LABEL_27;
          case 11:
            v56 = TRIPBGetMessageUInt32Field((uint64_t)self, v5);
            v18 = TRIPBComputeUInt32Size(v11, v56);
            goto LABEL_27;
          case 12:
            v57 = TRIPBGetMessageUInt64Field((uint64_t)self, v5);
LABEL_154:
            v67 = 8 * v11;
            v68 = v3;
            if ((8 * v11) >= 0x80)
            {
              if (v67 >= 0x4000)
              {
                if (v67 >= 0x200000)
                {
                  if (v67 >> 28)
                    v69 = 5;
                  else
                    v69 = 4;
                }
                else
                {
                  v69 = 3;
                }
              }
              else
              {
                v69 = 2;
              }
            }
            else
            {
              v69 = 1;
            }
            v73 = TRIPBComputeRawVarint64Size(v57);
            goto LABEL_192;
          case 13:
            v58 = self->messageStorage_;
            if (v58)
              v59 = *(void **)((char *)v58 + *(unsigned int *)(v9 + 24));
            else
              v59 = 0;
            v18 = TRIPBComputeBytesSize(v11, v59);
            goto LABEL_27;
          case 14:
            v60 = self->messageStorage_;
            if (v60)
              v61 = *(void **)((char *)v60 + *(unsigned int *)(v9 + 24));
            else
              v61 = 0;
            v18 = TRIPBComputeStringSize(v11, v61);
            goto LABEL_27;
          case 15:
            v62 = self->messageStorage_;
            if (v62)
              v63 = *(void **)((char *)v62 + *(unsigned int *)(v9 + 24));
            else
              v63 = 0;
            v18 = TRIPBComputeMessageSize(v11, v63);
            goto LABEL_27;
          case 16:
            v64 = self->messageStorage_;
            if (v64)
              v65 = *(void **)((char *)v64 + *(unsigned int *)(v9 + 24));
            else
              v65 = 0;
            v71 = 8 * v11;
            v68 = v3;
            if ((8 * v11) >= 0x80)
            {
              if (v71 >= 0x4000)
              {
                if (v71 >= 0x200000)
                {
                  if (v71 >> 28)
                    v69 = 10;
                  else
                    v69 = 8;
                }
                else
                {
                  v69 = 6;
                }
              }
              else
              {
                v69 = 4;
              }
            }
            else
            {
              v69 = 2;
            }
            v73 = objc_msgSend(v65, "serializedSize");
LABEL_192:
            v3 = v69 + v68 + v73;
            continue;
          case 17:
            v66 = TRIPBGetMessageInt32Field((uint64_t)self, v5);
            v18 = TRIPBComputeEnumSize(v11, v66);
            goto LABEL_27;
          default:
            continue;
        }
      }
    }
    v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v139, 16);
  }
  while (v91);
LABEL_201:
  v74 = objc_msgSend(v84, "isWireFormat");
  unknownFields = self->unknownFields_;
  if (v74)
    v76 = -[TRIPBUnknownFieldSet serializedSizeAsMessageSet](unknownFields, "serializedSizeAsMessageSet");
  else
    v76 = -[TRIPBUnknownFieldSet serializedSize](unknownFields, "serializedSize");
  v77 = v76;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  extensionMap = self->extensionMap_;
  v79 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v92, v134, 16);
  v80 = v77 + v3;
  if (v79)
  {
    v81 = *(_QWORD *)v93;
    do
    {
      for (ii = 0; ii != v79; ++ii)
      {
        if (*(_QWORD *)v93 != v81)
          objc_enumerationMutation(extensionMap);
        v80 += TRIPBComputeExtensionSerializedSizeIncludingTag(*(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * ii), (void *)-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * ii)));
      }
      v79 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v92, v134, 16);
    }
    while (v79);
  }
  return v80;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_3(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_5(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_6(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_7(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_8(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_9(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_10(uint64_t result, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (2 * a2) ^ (a2 >> 31);
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v2 >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_12(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_13(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __30__TRIPBMessage_serializedSize__block_invoke_14(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __38__TRIPBMessage_resolveInstanceMethod___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = objc_opt_class();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@: %@ can only be set to NO (to clear field)."), v7, NSStringFromSelector(*(SEL *)(*(_QWORD *)(a1 + 32) + 48)));
  }
  return TRIPBClearMessageField(a2, *(_QWORD *)(a1 + 32));
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((TRIPBResolveExtensionClassMethod((objc_class *)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "messageClass"), a3) & 1) != 0)return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TRIPBMessage;
  return objc_msgSendSuper2(&v6, sel_resolveClassMethod_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIPBMessage)initWithCoder:(id)a3
{
  TRIPBMessage *v4;
  void *v5;

  v4 = -[TRIPBMessage init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRIPBData"));
    if (objc_msgSend(v5, "length"))
      -[TRIPBMessage mergeFromData:extensionRegistry:](v4, "mergeFromData:extensionRegistry:", v5, 0);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = -[TRIPBMessage data](self, "data");
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("TRIPBData"));
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
