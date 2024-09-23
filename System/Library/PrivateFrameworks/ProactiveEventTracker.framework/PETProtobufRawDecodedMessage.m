@implementation PETProtobufRawDecodedMessage

- (PETProtobufRawDecodedMessage)initWithData:(id)a3
{
  return -[PETProtobufRawDecodedMessage initWithData:nestedFields:](self, "initWithData:nestedFields:", a3, 0);
}

- (PETProtobufRawDecodedMessage)initWithData:(id)a3 nestedFields:(id)a4
{
  id v6;
  id v7;
  PETProtobufRawDecodedMessage *v8;
  uint64_t v9;
  NSMutableDictionary *decodedDict;
  void *v11;
  char v12;
  PETProtobufRawDecodedMessage *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PETProtobufRawDecodedMessage;
  v8 = -[PETProtobufRawDecodedMessage init](&v15, sel_init);
  if (!v8)
    goto LABEL_4;
  v9 = objc_opt_new();
  decodedDict = v8->_decodedDict;
  v8->_decodedDict = (NSMutableDictionary *)v9;

  objc_storeStrong((id *)&v8->_nestedFields, a4);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v6);
  if (!-[PETProtobufRawDecodedMessage readFrom:](v8, "readFrom:", v11))
  {

    goto LABEL_6;
  }
  v12 = objc_msgSend(v11, "hasError");

  if ((v12 & 1) != 0)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
LABEL_4:
  v13 = v8;
LABEL_7:

  return v13;
}

- (BOOL)readFrom:(id)a3
{
  _BYTE *v4;
  int *v5;
  int *v6;
  int *v7;
  unint64_t v8;
  int *v9;
  uint64_t v10;
  double v11;
  void *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  void *v37;
  NSDictionary *nestedFields;
  void *v39;
  void *v40;
  PETProtobufRawDecodedMessage *v41;
  NSDictionary *v42;
  void *v43;
  void *v44;
  PETProtobufRawDecodedMessage *v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  NSMutableDictionary *decodedDict;
  void *v52;
  void *v53;
  NSMutableDictionary *v54;
  void *v55;
  void *v56;
  char isKindOfClass;
  NSMutableDictionary *v58;
  void *v59;
  void *v60;
  void *v61;
  NSMutableDictionary *v62;
  void *v63;
  NSMutableDictionary *v64;
  void *v65;
  PETProtobufRawDecodedMessage *v66;
  PETProtobufRawDecodedMessage *v67;
  BOOL v68;
  PETProtobufRawDecodedMessage *v70;
  void *context;

  v4 = a3;
  v5 = (int *)MEMORY[0x1E0D82BF0];
  v6 = (int *)MEMORY[0x1E0D82BD8];
  v7 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_58:
    v68 = v4[*v7] == 0;
  }
  else
  {
    v8 = 0x1E0CB3000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v70 = self;
LABEL_3:
    if (v4[*v7])
      goto LABEL_58;
    v10 = MEMORY[0x19400723C]();
    v12 = (void *)v10;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v5;
      v17 = *(_QWORD *)&v4[v16];
      v18 = v17 + 1;
      if (v17 == -1 || v18 > *(_QWORD *)&v4[*v6])
        break;
      v19 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v17);
      *(_QWORD *)&v4[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0)
        goto LABEL_13;
      v13 += 7;
      v20 = v14++ >= 9;
      if (v20)
      {
        v15 = 0;
        v21 = *v7;
        if (v4[v21])
          goto LABEL_61;
LABEL_14:
        v22 = 0;
        v23 = v15 >> 3;
        context = (void *)v10;
        switch(v15 & 7)
        {
          case 0uLL:
            v24 = 0;
            v25 = 0;
            v26 = 0;
            v27 = *(void **)(v8 + 2024);
            while (1)
            {
              v28 = *v5;
              v29 = *(_QWORD *)&v4[v28];
              v30 = v29 + 1;
              if (v29 == -1 || v30 > *(_QWORD *)&v4[*v6])
                break;
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v26 |= (unint64_t)(v31 & 0x7F) << v24;
              if ((v31 & 0x80) == 0)
                goto LABEL_32;
              v24 += 7;
              v20 = v25++ >= 9;
              if (v20)
              {
                v32 = 0;
                goto LABEL_35;
              }
            }
            v4[*v7] = 1;
LABEL_32:
            if (v4[*v7])
              v32 = 0;
            else
              v32 = v26;
LABEL_35:
            objc_msgSend(v27, "numberWithLongLong:", v32, v70);
            v49 = objc_claimAutoreleasedReturnValue();
            goto LABEL_42;
          case 1uLL:
            v33 = *(void **)(v8 + 2024);
            v34 = *v5;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v6])
            {
              v36 = *(double *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v35 + 8;
            }
            else
            {
              v4[v21] = 1;
              v36 = 0.0;
            }
            objc_msgSend(v33, "numberWithDouble:", v36, v70);
            v49 = objc_claimAutoreleasedReturnValue();
            goto LABEL_42;
          case 2uLL:
            PBReaderReadData();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            nestedFields = self->_nestedFields;
            objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInt:", v23);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](nestedFields, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              v41 = [PETProtobufRawDecodedMessage alloc];
              v42 = self->_nestedFields;
              objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInt:", v23);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v42, "objectForKeyedSubscript:", v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = -[PETProtobufRawDecodedMessage initWithData:nestedFields:](v41, "initWithData:nestedFields:", v37, v44);

              if (v45)
                -[PETProtobufRawDecodedMessage dictionaryRepresentation](v45, "dictionaryRepresentation");
              else
                objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              self = v70;
              v7 = (int *)MEMORY[0x1E0D82BC8];
            }
            else
            {
              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v37, 4);
              if (v50)
              {
                v45 = v50;
                v22 = v45;
                v8 = 0x1E0CB3000;
              }
              else
              {
                v66 = -[PETProtobufRawDecodedMessage initWithData:]([PETProtobufRawDecodedMessage alloc], "initWithData:", v37);
                v67 = v66;
                if (v66)
                  -[PETProtobufRawDecodedMessage dictionaryRepresentation](v66, "dictionaryRepresentation");
                else
                  objc_msgSend(v37, "base64EncodedStringWithOptions:", 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v8 = 0x1E0CB3000;

                v45 = 0;
              }
            }

            goto LABEL_46;
          case 5uLL:
            v46 = *(void **)(v8 + 2024);
            v47 = *v5;
            v48 = *(_QWORD *)&v4[v47];
            if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(_QWORD *)&v4[*v6])
            {
              LODWORD(v11) = *(_DWORD *)(*(_QWORD *)&v4[*v9] + v48);
              *(_QWORD *)&v4[v47] = v48 + 4;
            }
            else
            {
              v4[v21] = 1;
              LODWORD(v11) = 0;
            }
            objc_msgSend(v46, "numberWithFloat:", v11, v70);
            v49 = objc_claimAutoreleasedReturnValue();
LABEL_42:
            v22 = (void *)v49;
LABEL_46:
            if (v4[*v7])
            {
              v12 = context;
LABEL_60:

              goto LABEL_61;
            }
            decodedDict = self->_decodedDict;
            objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInt:", v23);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](decodedDict, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            v54 = self->_decodedDict;
            objc_msgSend(*(id *)(v8 + 2024), "numberWithUnsignedInt:", v23);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v53)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](v54, "objectForKeyedSubscript:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) == 0)
              {
                v58 = self->_decodedDict;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v60);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = self->_decodedDict;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v61, v63);

                self = v70;
              }
              v64 = self->_decodedDict;
              v8 = 0x1E0CB3000uLL;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23, v70);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKeyedSubscript:](v64, "objectForKeyedSubscript:", v55);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "addObject:", v22);

              v7 = (int *)MEMORY[0x1E0D82BC8];
            }
            else
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](v54, "setObject:forKeyedSubscript:", v22, v55);
              v7 = (int *)MEMORY[0x1E0D82BC8];
              v8 = 0x1E0CB3000;
            }
            v5 = (int *)MEMORY[0x1E0D82BF0];
            v9 = (int *)MEMORY[0x1E0D82BB8];

            objc_autoreleasePoolPop(context);
            if (*(_QWORD *)&v4[*v5] >= *(_QWORD *)&v4[*v6])
              goto LABEL_58;
            break;
          default:
            goto LABEL_60;
        }
        goto LABEL_3;
      }
    }
    v4[*v7] = 1;
LABEL_13:
    v21 = *v7;
    if (!v4[v21])
      goto LABEL_14;
LABEL_61:
    objc_autoreleasePoolPop(v12);
    v68 = 0;
  }

  return v68;
}

- (id)dictionaryRepresentation
{
  return (id)-[NSMutableDictionary copy](self->_decodedDict, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nestedFields, 0);
  objc_storeStrong((id *)&self->_decodedDict, 0);
}

@end
