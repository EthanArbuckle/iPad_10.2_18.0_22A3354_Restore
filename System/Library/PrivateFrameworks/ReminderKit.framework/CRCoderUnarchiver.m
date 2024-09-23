@implementation CRCoderUnarchiver

+ (void)initialize
{
  +[CRCoder registerCRClasses](CRCoder, "registerCRClasses");
}

+ (id)decodedDocumentFromData:(id)a3 replica:(id)a4
{
  id v5;
  id v6;
  CRCoderUnarchiver *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(CRCoderUnarchiver);
  -[CRCoderUnarchiver decodeDocumentFromData:replica:](v7, "decodeDocumentFromData:replica:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)willModifySelfInInitForClass:(Class)a3
{
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (id)allocedObjectAtIndex:(unint64_t)a3 outNeedsInit:(BOOL *)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  __objc2_class **v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;

  if (a4)
    *a4 = 1;
  if (*(int *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 64) <= a3)
  {
LABEL_22:
    v14 = 0;
  }
  else
  {
    while (1)
    {
      -[CRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      -[CRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 > a3)
        break;
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 == v13)
    {

      v15 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_DocObject>::TypeHandler>((uint64_t)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 56), a3);
      v14 = 0;
      v16 = off_1E67F47F8;
      switch(*(_DWORD *)(v15 + 48))
      {
        case 1:
          goto LABEL_19;
        case 2:
          v16 = off_1E67F47F0;
          goto LABEL_19;
        case 3:
          v16 = off_1E67F4800;
          goto LABEL_19;
        case 4:
          v16 = off_1E67F4818;
          goto LABEL_19;
        case 6:
          v16 = off_1E67F47D8;
          goto LABEL_19;
        case 7:
          v16 = off_1E67F4828;
          goto LABEL_19;
        case 8:
          v16 = off_1E67F4838;
          goto LABEL_19;
        case 0xA:
          v16 = off_1E67F53C0;
          goto LABEL_19;
        case 0xD:
          v18 = *(_QWORD *)(v15 + 40);
          if ((*(_BYTE *)(v18 + 32) & 1) == 0)
            goto LABEL_22;
          v20 = *(int *)(v18 + 64);
          -[CRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndex:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[CRCoder typeToClassDict](self, "typeToClassDict");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_msgSend(v23, "objectForKeyedSubscript:", v22);

          if (-[CRCoderUnarchiver willModifySelfInInitForClass:](self, "willModifySelfInInitForClass:", v24))
          {
            if (a4)
              *a4 = 0;
            v25 = (id)objc_msgSend([v24 alloc], "initWithCRCoder:", self);
          }
          else
          {
            v25 = [v24 alloc];
          }
          v26 = v25;

          v14 = v26;
          if (!v26)
            return v14;
          goto LABEL_20;
        case 0xE:
          v16 = off_1E67F53B8;
          goto LABEL_19;
        case 0xF:
          v16 = off_1E67F47B0;
          goto LABEL_19;
        case 0x10:
          v16 = off_1E67F4830;
LABEL_19:
          v14 = objc_alloc(*v16);
          if (v14)
          {
LABEL_20:
            -[CRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:atIndexedSubscript:", v14, a3);

          }
          break;
        default:
          return v14;
      }
    }
    else
    {
      v14 = v12;
    }
  }
  return v14;
}

- (id)decodeDocumentFromData:(id)a3 replica:(id)a4
{
  id v6;
  CRDT::Document *v7;
  void *v8;
  google::protobuf::MessageLite *v9;
  id v10;
  void *v11;
  uint64_t i;
  int *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  CRVectorTimestamp *v18;
  _QWORD *v19;
  uint64_t v20;
  CRVectorTimestamp *v21;
  _QWORD *v22;
  uint64_t v23;
  CRDocument *v24;
  TTCRVectorMultiTimestamp *v25;
  _QWORD *v26;
  uint64_t v27;
  CRTTCompatibleDocument *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t j;
  int *v33;
  void *v34;
  void *v35;
  uint64_t k;
  int *v37;
  void *v38;
  void *v39;
  int v40;
  char v41;
  char v42;
  uint64_t v43;
  _QWORD *m;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  void (**v59)(_QWORD, _QWORD);
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CRVectorTimestamp *v65;
  CRVectorTimestamp *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v6 = a4;
  -[CRCoderUnarchiver setReplica:](self, "setReplica:", v6);
  v7 = (CRDT::Document *)operator new();
  CRDT::Document::Document(v7);
  -[CRCoderUnarchiver setCurrentDocument:](self, "setCurrentDocument:", v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", v8);

  v9 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
  v10 = objc_retainAutorelease(v67);
  if (!google::protobuf::MessageLite::ParseFromArray(v9, (char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"))|| !*(_DWORD *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 64))
  {
    v17 = 0;
    goto LABEL_45;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(int *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 136));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCoderUnarchiver setUuidArray:](self, "setUuidArray:", v11);

  for (i = *(_QWORD *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 128); ; i += 8)
  {
    v13 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
    if (i == *((_QWORD *)v13 + 16) + 8 * v13[34])
      break;
    v14 = *(_QWORD **)i;
    if (*(char *)(*(_QWORD *)i + 23) < 0)
      v14 = (_QWORD *)*v14;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v14);
    -[CRCoderUnarchiver uuidArray](self, "uuidArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);

  }
  v18 = [CRVectorTimestamp alloc];
  v19 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
  v20 = v19[5];
  if (!v20)
    v20 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v19) + 40);
  v65 = -[CRVectorTimestamp initWithProtobufTimestamp:decoder:](v18, "initWithProtobufTimestamp:decoder:", v20, self);
  v21 = [CRVectorTimestamp alloc];
  v22 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
  v23 = v22[6];
  if (!v23)
    v23 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v22) + 48);
  v66 = -[CRVectorTimestamp initWithProtobufTimestamp:decoder:](v21, "initWithProtobufTimestamp:decoder:", v23, self);
  if ((*(_BYTE *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 32) & 0x40) != 0)
  {
    v25 = [TTCRVectorMultiTimestamp alloc];
    v26 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
    v27 = v26[19];
    if (!v27)
      v27 = *(_QWORD *)(CRDT::Document::default_instance((CRDT::Document *)v26) + 152);
    v24 = -[TTVectorMultiTimestamp initWithArchive:andCapacity:](v25, "initWithArchive:andCapacity:", v27, 2);
    v28 = -[CRTTCompatibleDocument initWithVersion:startVersion:rootObject:replica:topoTimestamp:]([CRTTCompatibleDocument alloc], "initWithVersion:startVersion:rootObject:replica:topoTimestamp:", v65, v66, 0, v6, v24);
    -[CRCoderUnarchiver setDocument:](self, "setDocument:", v28);

  }
  else
  {
    v24 = -[CRDocument initWithVersion:startVersion:rootObject:replica:]([CRDocument alloc], "initWithVersion:startVersion:rootObject:replica:", v65, v66, 0, v6);
    -[CRCoderUnarchiver setDocument:](self, "setDocument:", v24);
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", *(int *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 112));
  -[CRCoderUnarchiver setTypeSetForDecoding:](self, "setTypeSetForDecoding:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", *(int *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 88));
  -[CRCoderUnarchiver setKeySet:](self, "setKeySet:", v30);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(int *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 64));
  -[CRCoderUnarchiver setAllocedDocObjects:](self, "setAllocedDocObjects:", v31);

  for (j = *(_QWORD *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 104); ; j += 8)
  {
    v33 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
    if (j == *((_QWORD *)v33 + 13) + 8 * v33[28])
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v34);

  }
  for (k = *(_QWORD *)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 80); ; k += 8)
  {
    v37 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
    if (k == *((_QWORD *)v37 + 10) + 8 * v37[22])
      break;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCoderUnarchiver keySet](self, "keySet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObject:", v38);

  }
  v40 = 0;
  v41 = 1;
  do
  {
    v42 = v41;
    v43 = 0;
    for (m = *(_QWORD **)(-[CRCoderUnarchiver currentDocument](self, "currentDocument") + 56); ; ++m)
    {
      v45 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
      if (m == (_QWORD *)(*((_QWORD *)v45 + 7) + 8 * v45[16]))
        break;
      v46 = *m;
      -[CRCoderUnarchiver setCurrentDocObjectForDecodingPtr:](self, "setCurrentDocObjectForDecodingPtr:", *m);
      if (*(_DWORD *)(v46 + 48) == 13)
      {
        v47 = *(_QWORD *)(v46 + 40);
        if ((*(_BYTE *)(v47 + 32) & 1) == 0)
          goto LABEL_35;
        v48 = *(int *)(v47 + 64);
        -[CRCoderUnarchiver typeSetForDecoding](self, "typeSetForDecoding");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndex:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[CRCoder typeToClassDict](self, "typeToClassDict");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "objectForKeyedSubscript:", v50);

        LODWORD(v51) = -[CRCoderUnarchiver willModifySelfInInitForClass:](self, "willModifySelfInInitForClass:", v52);
        if (((v40 ^ v51) & 1) == 0)
          goto LABEL_35;
      }
      else if ((v40 & 1) == 0)
      {
        goto LABEL_35;
      }
      v72 = 0;
      -[CRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:](self, "allocedObjectAtIndex:outNeedsInit:", v43, &v72);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v72)

LABEL_35:
      ++v43;
    }
    v41 = 0;
    v40 = 1;
  }
  while ((v42 & 1) != 0);
  -[CRCoderUnarchiver sortCompletionHandlers](self, "sortCompletionHandlers");
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v56)
  {
    v57 = *(_QWORD *)v69;
    do
    {
      for (n = 0; n != v56; ++n)
      {
        if (*(_QWORD *)v69 != v57)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * n), "block");
        v59 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, CRCoderUnarchiver *))v59)[2](v59, self);

      }
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v56);
  }

  -[CRCoderUnarchiver allocedDocObjects](self, "allocedDocObjects");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCoderUnarchiver setCurrentDocObjectForDecodingPtr:](self, "setCurrentDocObjectForDecodingPtr:", 0);
  -[CRCoderUnarchiver setTypeSetForDecoding:](self, "setTypeSetForDecoding:", 0);
  -[CRCoderUnarchiver setKeySet:](self, "setKeySet:", 0);
  -[CRCoderUnarchiver setAllocedDocObjects:](self, "setAllocedDocObjects:", 0);

LABEL_45:
  -[CRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", 0);
  v61 = -[CRCoderUnarchiver currentDocument](self, "currentDocument");
  if (v61)
    (*(void (**)(void *))(*(_QWORD *)v61 + 8))(v61);
  -[CRCoderUnarchiver setCurrentDocument:](self, "setCurrentDocument:", 0);
  -[CRCoderUnarchiver document](self, "document");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setRootObject:", v17);

  -[CRCoderUnarchiver document](self, "document");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  return v63;
}

- (const)currentObjectIDForKey:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  const void *v12;

  v4 = a3;
  if (*(_DWORD *)(-[CRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr") + 48) != 13
    || ((v5 = -[CRCoderUnarchiver currentDocObjectForDecodingPtr](self, "currentDocObjectForDecodingPtr"),
         *((_DWORD *)v5 + 12) != 13)
      ? (v6 = CRDT::Document_CustomObject::default_instance((CRDT::Document_CustomObject *)v5))
      : (v6 = v5[5]),
        (v7 = -[CRCoderUnarchiver indexForKey:](self, "indexForKey:", v4), v8 = v7, v7 == 0x7FFFFFFFFFFFFFFFLL)
     || *(int *)(v6 + 48) < 1))
  {
LABEL_13:
    v12 = 0;
  }
  else
  {
    v9 = 0;
    while (1)
    {
      v10 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<CRDT::Document_CustomObject_MapEntry>::TypeHandler>(v6 + 40, v9);
      if ((~*(_DWORD *)(v10 + 32) & 3) == 0 && *(_DWORD *)(v10 + 48) == v8)
        break;
      if (++v9 >= *(_DWORD *)(v6 + 48))
        goto LABEL_13;
    }
    v12 = *(const void **)(v10 + 40);
    if (!v12)
      v12 = *(const void **)(CRDT::Document_CustomObject_MapEntry::default_instance((CRDT::Document_CustomObject_MapEntry *)v10)
                           + 40);
  }

  return v12;
}

- (id)decodeObjectForKey:(id)a3
{
  id v4;
  const void *v5;
  void *v6;

  v4 = a3;
  v5 = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (v5)
  {
    -[CRCoderUnarchiver decodeObjectForProtobufObjectID:](self, "decodeObjectForProtobufObjectID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)decodeObjectForProtobufObjectID:(const void *)a3
{
  void *v3;

  if (*((_DWORD *)a3 + 12) == 6)
  {
    -[CRCoderUnarchiver allocedObjectAtIndex:outNeedsInit:](self, "allocedObjectAtIndex:outNeedsInit:", *((unsigned int *)a3 + 10), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)decodeStringForKey:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t *v6;
  void *v7;

  v4 = a3;
  v5 = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", v4);
  if (*((_DWORD *)v5 + 12) == 4)
  {
    v6 = (uint64_t *)v5[5];
    if (*((char *)v6 + 23) < 0)
      v6 = (uint64_t *)*v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)decodeUUIDForKey:(id)a3
{
  void *v3;
  void *v4;

  -[CRCoderUnarchiver decodeStringForKey:](self, "decodeStringForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
  else
    v4 = 0;

  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  double *v3;
  double result;

  v3 = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3);
  result = 0.0;
  if (*((_DWORD *)v3 + 12) == 3)
    return v3[5];
  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  _DWORD *v3;

  v3 = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3);
  if (v3)
  {
    if (v3[12] == 1)
      LODWORD(v3) = v3[10];
    else
      LODWORD(v3) = 0;
  }
  return (int)v3;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t result;

  result = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3);
  if (result)
  {
    if (*(_DWORD *)(result + 48) == 1)
      return *(_QWORD *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (unsigned)decodeUInt32ForKey:(id)a3
{
  _DWORD *v3;

  v3 = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3);
  if (v3)
  {
    if (v3[12] == 2)
      LODWORD(v3) = v3[10];
    else
      LODWORD(v3) = 0;
  }
  return v3;
}

- (unint64_t)decodeUInt64ForKey:(id)a3
{
  unint64_t result;

  result = -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3);
  if (result)
  {
    if (*(_DWORD *)(result + 48) == 2)
      return *(_QWORD *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (id)decodeUUIDFromUUIDIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[CRCoderUnarchiver uuidArray](self, "uuidArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasDecodableValueForKey:(id)a3
{
  return -[CRCoderUnarchiver currentObjectIDForKey:](self, "currentObjectIDForKey:", a3) != 0;
}

- (void)addDecoderCompletionHandler:(id)a3 dependency:(id)a4 for:(id)a5
{
  id v8;
  id v9;
  CRCoderUnarchiverCompletionHandler *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(CRCoderUnarchiverCompletionHandler);
  -[CRCoderUnarchiverCompletionHandler setBlock:](v10, "setBlock:", v12);
  -[CRCoderUnarchiverCompletionHandler setDependency:](v10, "setDependency:", v8);
  -[CRCoderUnarchiverCompletionHandler setValue:](v10, "setValue:", v9);
  -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v10);

}

- (void)sortCompletionHandlers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
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

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  while (1)
  {
    -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 0;

    if (v7)
      break;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v9)
      goto LABEL_24;
    v10 = *(_QWORD *)v31;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
      objc_msgSend(v12, "dependency");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13 == 0;

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (!v9)
        {
LABEL_24:

LABEL_25:
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("No topological sort of completion handlers."), 0);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v25);
        }
        goto LABEL_5;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_25;
    objc_msgSend(v5, "addObject:", v15);
    -[CRCoderUnarchiver completionHandlers](self, "completionHandlers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v15);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[CRCoderUnarchiver completionHandlers](self, "completionHandlers", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v21, "dependency");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v22 == v23;

          if (v24)
            objc_msgSend(v21, "setDependency:", 0);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

  }
  -[CRCoderUnarchiver setCompletionHandlers:](self, "setCompletionHandlers:", v5);

}

- (unint64_t)indexForKey:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[CRCoderUnarchiver keySet](self, "keySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (NSUUID)replica
{
  return self->_replica;
}

- (void)setReplica:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CRDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (NSMutableArray)allocedDocObjects
{
  return self->_allocedDocObjects;
}

- (void)setAllocedDocObjects:(id)a3
{
  objc_storeStrong((id *)&self->_allocedDocObjects, a3);
}

- (const)currentDocObjectForDecodingPtr
{
  return self->_currentDocObjectForDecodingPtr;
}

- (void)setCurrentDocObjectForDecodingPtr:(const void *)a3
{
  self->_currentDocObjectForDecodingPtr = a3;
}

- (NSMutableOrderedSet)typeSetForDecoding
{
  return self->_typeSetForDecoding;
}

- (void)setTypeSetForDecoding:(id)a3
{
  objc_storeStrong((id *)&self->_typeSetForDecoding, a3);
}

- (NSMutableOrderedSet)keySet
{
  return self->_keySet;
}

- (void)setKeySet:(id)a3
{
  objc_storeStrong((id *)&self->_keySet, a3);
}

- (NSMutableArray)uuidArray
{
  return self->_uuidArray;
}

- (void)setUuidArray:(id)a3
{
  objc_storeStrong((id *)&self->_uuidArray, a3);
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_uuidArray, 0);
  objc_storeStrong((id *)&self->_keySet, 0);
  objc_storeStrong((id *)&self->_typeSetForDecoding, 0);
  objc_storeStrong((id *)&self->_allocedDocObjects, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replica, 0);
}

@end
