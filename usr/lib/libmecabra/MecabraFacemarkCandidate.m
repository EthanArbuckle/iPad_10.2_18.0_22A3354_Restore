@implementation MecabraFacemarkCandidate

- (MecabraFacemarkCandidate)initWithString:(id)a3 category:(id)a4
{
  MecabraFacemarkCandidate *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MecabraFacemarkCandidate;
  v6 = -[MecabraFacemarkCandidate init](&v12, sel_init);
  v6->_string = (NSString *)objc_msgSend_copy(a3, v7, v8);
  v6->_category = (NSString *)objc_msgSend_copy(a4, v9, v10);
  return v6;
}

+ (id)candidateWithString:(id)a3 category:(id)a4
{
  id v6;
  const char *v7;

  v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithString_category_(v6, v7, (uint64_t)a3, a4);
}

- (id)surface
{
  return self->_string;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@ (%@)"), self->_string, self->_category);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MecabraFacemarkCandidate;
  -[MecabraFacemarkCandidate dealloc](&v3, sel_dealloc);
}

+ (id)copyFacemarkCandidatesForLocale:(id)a3
{
  CFComparisonResult v4;

  v4 = sub_20B8D0E78((const __CFLocale *)a3);
  return (id)MEMORY[0x24BEDD108](a1, sel_copyFacemarkCandidatesForLanguage_, v4);
}

+ (id)copyFacemarkCandidatesForLanguage:(int)a3
{
  signed int v4;
  _QWORD *v5;
  uint64_t *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  MecabraFacemarkCandidate *v24;
  const char *v25;
  void *v26;
  const char *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if ((a3 - 1) < 2 || a3 == 5)
    v4 = 3;
  else
    v4 = a3;
  v5 = (_QWORD *)sub_20B9AE60C();
  v6 = sub_20B9AE6A0(v5, v4, off_254729648[0], off_2547295B0[0]);
  v8 = (void *)MEMORY[0x24BDBCE30];
  if (*((char *)v6 + 23) >= 0)
    v9 = objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, (uint64_t)v6, 4);
  else
    v9 = objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, *v6, 4);
  v11 = objc_msgSend_arrayWithContentsOfFile_(v8, v10, v9);
  if (!v11)
    return 0;
  v12 = (void *)v11;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v29, v33, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v21 = objc_msgSend_objectForKey_(v20, v16, (uint64_t)CFSTR("string"));
        v23 = objc_msgSend_objectForKey_(v20, v22, (uint64_t)CFSTR("category"));
        v24 = [MecabraFacemarkCandidate alloc];
        v26 = (void *)objc_msgSend_initWithString_category_(v24, v25, v21, v23);
        objc_msgSend_addObject_(v13, v27, (uint64_t)v26);

      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v16, (uint64_t)&v29, v33, 16);
    }
    while (v17);
  }
  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)category
{
  return self->_category;
}

@end
