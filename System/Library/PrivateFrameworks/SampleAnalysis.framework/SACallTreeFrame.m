@implementation SACallTreeFrame

- (SAFrame)frame
{
  return (SAFrame *)objc_getProperty(self, a2, 32, 1);
}

- (SACallTreeFrame)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  id v11;
  SACallTreeFrame *v12;
  SACallTreeFrame *v13;
  NSMutableArray *v14;
  NSMutableArray *children;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SACallTreeFrame;
  v12 = -[SACallTreeNode initWithStartSampleIndex:sampleCount:](&v17, sel_initWithStartSampleIndex_sampleCount_, a4, a5);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_frame, a3);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    children = v13->_children;
    v13->_children = v14;

    v13->_isLeafFrame = a6;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_frame, 0);
}

+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;

  v6 = a6;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFrame:startSampleIndex:sampleCount:isLeafFrame:", v10, a4, a5, v6);

  return v11;
}

- (BOOL)isTruncatedLeafCallstack
{
  return 0;
}

- (NSArray)childFrames
{
  return (NSArray *)FilterArrayToCallTreeFrames(self->_children);
}

+ (void)enumerateTree:(void *)a3 block:
{
  id v4;
  void (**v5)(id, void *, uint64_t, char *);
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id Property;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  void *v21;
  _DWORD *v22;
  SACallTreeStateChildren *v23;
  const char *v24;
  id v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  SACallTreeStateChildren *v30;
  void *v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  char v37;
  objc_super v38;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    v10 = sel_initWithStartSampleIndex_sampleCount_;
    v11 = 0x1EF23E000uLL;
    while (1)
    {
      objc_msgSend(v8, "lastObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_29;
      v13 = (void *)v12;
      while (!objc_msgSend(v13, "count"))
      {
        v9 = (v9 - 1);
        objc_msgSend(v8, "removeLastObject");
        objc_msgSend(v8, "lastObject");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v14;
        if (!v14)
          goto LABEL_29;
      }
      objc_msgSend(v13, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectAtIndex:", 0);
      v37 = 0;
      v5[2](v5, v15, v9, &v37);
      if (v37)
      {

        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = v10;
        v22 = v15;
        v23 = [SACallTreeStateChildren alloc];
        v35 = objc_msgSend(v22, "startSampleIndex");
        v34 = objc_msgSend(v22, "sampleCount");
        if (v22)
        {
          v25 = objc_getProperty(v22, v24, 88, 1);
          v27 = objc_getProperty(v22, v26, 80, 1);
          LODWORD(v32) = v22[10];
          HIDWORD(v32) = v22[9];
        }
        else
        {
          v32 = 0;
          v25 = 0;
          v27 = 0;
        }
        obj = v25;
        v28 = v25;
        v29 = v27;
        if (v23)
        {
          v38.receiver = v23;
          v38.super_class = (Class)SACallTreeStateChildren;
          v30 = (SACallTreeStateChildren *)objc_msgSendSuper2(&v38, v36, v35, v34);
          v23 = v30;
          if (v30)
          {
            objc_storeStrong((id *)&v30->_timeRanges, obj);
            objc_storeStrong((id *)&v23->_ioEvents, v27);
            v23->_originPid = HIDWORD(v32);
            v23->_proximatePid = v32;
          }
        }

        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v23, 0);
        objc_msgSend(v8, "addObject:", v31);

        v9 = (v9 + 1);
        v10 = (char *)v36;
        v11 = 0x1EF23E000;
        goto LABEL_23;
      }
LABEL_24:

      if (!objc_msgSend(v8, "count"))
        goto LABEL_29;
    }
    Property = v15;
    v18 = Property;
    if (Property)
      Property = objc_getProperty(Property, v17, *(int *)(v11 + 1956), 1);
    if (objc_msgSend(Property, "count"))
    {
      if (v18)
        v20 = objc_getProperty(v18, v19, *(int *)(v11 + 1956), 1);
      else
        v20 = 0;
      v21 = (void *)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(v8, "addObject:", v21);

      v9 = (v9 + 1);
    }
LABEL_23:

    goto LABEL_24;
  }
LABEL_29:

}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  SAFrame *frame;
  id v5;
  id v6;

  frame = self->_frame;
  v5 = a3;
  -[SAFrame writeJSONDictionaryEntriesToStream:](frame, "writeJSONDictionaryEntriesToStream:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, CFSTR("count"), v6);

}

@end
