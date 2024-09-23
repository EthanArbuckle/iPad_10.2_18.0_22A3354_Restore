@implementation PKPrintSettings

- (void)_setupDefaults
{
  PKPaper *v3;
  PKPaper *paper;
  NSString *orientation;

  +[PKPaper genericLetterPaper](PKPaper, "genericLetterPaper");
  v3 = (PKPaper *)objc_claimAutoreleasedReturnValue();
  paper = self->_paper;
  self->_paper = v3;

  self->_copies = 1;
  orientation = self->_orientation;
  self->_orientation = 0;

  objc_storeStrong((id *)&self->_printQuality, CFSTR("3"));
}

- (PKPrintSettings)init
{
  PKPrintSettings *v2;
  PKPrintSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPrintSettings;
  v2 = -[PKPrintSettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PKPrintSettings _setupDefaults](v2, "_setupDefaults");
  return v3;
}

- (PKPrintSettings)initWithPaper:(id)a3
{
  id v4;
  PKPrintSettings *v5;
  PKPrintSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  v5 = -[PKPrintSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPrintSettings _setupDefaults](v5, "_setupDefaults");
    -[PKPrintSettings setPaper:](v6, "setPaper:", v4);
  }

  return v6;
}

- (PKPrintSettings)initWithSettings:(id)a3
{
  void *v4;
  PKPrintSettings *v5;

  objc_msgSend(a3, "userCodableDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[PKPrintSettings initWithUserCodableDictionary:](self, "initWithUserCodableDictionary:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSettings:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 2, CFSTR("version"));
  EncodeVisitor::visitProperties(self, v4);

}

- (PKPrintSettings)initWithCoder:(id)a3
{
  id v4;
  PKPrintSettings *v5;
  PKPrintSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  v5 = -[PKPrintSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPrintSettings _setupDefaults](v5, "_setupDefaults");
    if (objc_msgSend(v4, "decodeIntForKey:", CFSTR("version")) != 2)
      __assert_rtn("-[PKPrintSettings initWithCoder:]", "PKPrintSettings.m", 75, "[coder decodeIntForKey:@\"version\"] == 2");
    DecodeVisitor::visitProperties(v6, v4);
  }

  return v6;
}

+ (id)default
{
  return (id)objc_opt_new();
}

+ (id)photo
{
  PKPrintSettings *v2;
  void *v3;
  PKPrintSettings *v4;

  v2 = [PKPrintSettings alloc];
  +[PKPaper generic4x6Paper](PKPaper, "generic4x6Paper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPrintSettings initWithPaper:](v2, "initWithPaper:", v3);

  -[PKPrintSettings setObject:forKey:](v4, "setObject:forKey:", CFSTR("5"), CFSTR("print-quality"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __27__PKPrintSettings_isEqual___block_invoke;
    v7[3] = &unk_24E6CD738;
    v7[4] = &v8;
    CompareVisitor::visitProperties(self, v4, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __27__PKPrintSettings_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 200))(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKPrintSettings userCodableDictionary](self, "userCodableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)userCodableDictionary
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__PKPrintSettings_userCodableDictionary__block_invoke;
  v6[3] = &unk_24E6CD670;
  v4 = v3;
  v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __40__PKPrintSettings_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = v8;
  if (*a5)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

  }
}

- (PKPrintSettings)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKPrintSettings *v5;
  PKPrintSettings *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrintSettings;
  v5 = -[PKPrintSettings init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PKPrintSettings _setupDefaults](v5, "_setupDefaults");
    -[PKPrintSettings setFromUserCodableDictionary:](v6, "setFromUserCodableDictionary:", v4);
  }

  return v6;
}

- (void)setFromUserCodableDictionary:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PKPrintSettings_setFromUserCodableDictionary___block_invoke;
  v6[3] = &unk_24E6CD670;
  v7 = v4;
  v5 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

}

void __48__PKPrintSettings_setFromUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  void (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *a5;
    *a5 = (void *)v10;

  }
}

- (id)debugDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__PKPrintSettings_debugDescription__block_invoke;
  v4[3] = &unk_24E6CD710;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__PKPrintSettings_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 208))(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 200))(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ Encoded classes: %@, properties %@"), v10, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, const __CFString *, PKPaper **))a3->var0 + 19))(a3, CFSTR("paper"), &self->_paper);
  (*((void (**)(Visitor *, const __CFString *, NSURL **))a3->var0 + 8))(a3, CFSTR("printerInfoURL"), &self->_printerInfoURL);
  (*((void (**)(Visitor *, const __CFString *, NSURL **))a3->var0 + 8))(a3, CFSTR("printerSuppliesURL"), &self->_printerSuppliesURL);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("annotationsImaged"), &self->_annotationsImaged);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("copies"), &self->_copies);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("documentPassword"), &self->_documentPassword);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("duplex"), &self->_duplex);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("finishingTemplate"), &self->_finishingTemplate);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 14))(a3, CFSTR("finishings"), &self->_finishings);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("inputSlot"), &self->_inputSlot);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("mediaType"), &self->_mediaType);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("jobAccountID"), &self->_jobAccountID);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("jobName"), &self->_jobName);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("orientation"), &self->_orientation);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("outputBin"), &self->_outputBin);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("outputMode"), &self->_outputMode);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("pageScale"), &self->_pageScale);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("pageStackOrder"), &self->_pageStackOrder);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("printQuality"), &self->_printQuality);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("thumbnailPosition"), &self->_thumbnailPosition);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("fileType"), &self->_fileType);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("pageRanges_asStringArray"), &self->_pageRanges_asStringArray);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("jobPresetName"), &self->_jobPresetName);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

- (id)keyedNameToVisitName:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  _QWORD v10[18];
  _QWORD v11[19];

  v11[18] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  {
    v10[0] = CFSTR("com.apple.image-pdf-annotations");
    v10[1] = CFSTR("copies");
    v11[0] = CFSTR("annotationsImaged");
    v11[1] = CFSTR("copies");
    v10[2] = CFSTR("document-password");
    v10[3] = CFSTR("sides");
    v11[2] = CFSTR("documentPassword");
    v11[3] = CFSTR("duplex");
    v10[4] = CFSTR("com.apple.finishingTemplate");
    v10[5] = CFSTR("com.apple.finishings");
    v11[4] = CFSTR("finishingTemplate");
    v11[5] = CFSTR("finishings");
    v10[6] = CFSTR("com.apple.inputSlot");
    v10[7] = CFSTR("job-account-id");
    v11[6] = CFSTR("inputSlot");
    v11[7] = CFSTR("jobAccountID");
    v10[8] = CFSTR("job-name");
    v10[9] = CFSTR("com.apple.mediaType");
    v11[8] = CFSTR("jobName");
    v11[9] = CFSTR("mediaType");
    v10[10] = CFSTR("orientation-requested");
    v10[11] = CFSTR("com.apple.outputBin");
    v11[10] = CFSTR("orientation");
    v11[11] = CFSTR("outputBin");
    v10[12] = CFSTR("print-color-mode");
    v10[13] = CFSTR("page-ranges");
    v11[12] = CFSTR("outputMode");
    v11[13] = CFSTR("pageRanges");
    v10[14] = CFSTR("com.apple.page-scaling");
    v10[15] = CFSTR("com.apple.pageStackOrder");
    v11[14] = CFSTR("pageScale");
    v11[15] = CFSTR("pageStackOrder");
    v10[16] = CFSTR("print-quality");
    v10[17] = CFSTR("com.apple.thumbnail-position");
    v11[16] = CFSTR("printQuality");
    v11[17] = CFSTR("thumbnailPosition");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 18);
    -[PKPrintSettings keyedNameToVisitName:]::sMapping = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)-[PKPrintSettings keyedNameToVisitName:]::sMapping, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "No mapping to old style key from %@ anymore - use properties directly", (uint8_t *)&v8, 0xCu);
    }

  }
  return v5;
}

- (NSArray)pageRanges
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSRange v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[PKPrintSettings pageRanges_asStringArray](self, "pageRanges_asStringArray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = (void *)MEMORY[0x24BDD1968];
          v10 = NSRangeFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          objc_msgSend(v9, "valueWithRange:", v10.location, v10.length, (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setPageRanges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  NSRange v18;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v7);
          v18.location = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "rangeValue", (_QWORD)v12);
          NSStringFromRange(v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    v6 = 0;
  }

  -[PKPrintSettings setPageRanges_asStringArray:](self, "setPageRanges_asStringArray:", v6);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.jobPreset")))
  {
    -[__CFString objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("PresetInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UIPrintInfoJobPresetKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("JobPresetOption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preset-name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPrintSettings setJobPresetName:](self, "setJobPresetName:", v11);

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("page-ranges")))
  {
    -[PKPrintSettings setPageRanges:](self, "setPageRanges:", v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "isEqualToString:", CFSTR("print-quality")))
    {
      v12 = -[__CFString integerValue](v6, "integerValue");
      v13 = CFSTR("3");
      if (v12 != objc_msgSend(CFSTR("3"), "integerValue"))
      {
        v14 = -[__CFString integerValue](v6, "integerValue");
        if (v14 == objc_msgSend(CFSTR("5"), "integerValue"))
          v13 = CFSTR("5");
        else
          v13 = CFSTR("4");
      }
      v15 = v13;

      v6 = v15;
    }
    -[PKPrintSettings keyedNameToVisitName:](self, "keyedNameToVisitName:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[PKPrintSettings userCodableDictionary](self, "userCodableDictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v6);

      if ((v19 & 1) == 0)
      {
        v21 = v16;
        v22 = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPrintSettings setFromUserCodableDictionary:](self, "setFromUserCodableDictionary:", v20);

      }
    }
    else
    {
      _PKLogCategory(PKLogCategoryFramework);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_impl(&dword_220F9A000, v17, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", buf, 0xCu);
      }
    }

  }
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("orientation-requested")) & 1) != 0)
  {
    -[PKPrintSettings setOrientation:](self, "setOrientation:", 0);
  }
  else
  {
    _PKLogCategory(PKLogCategoryFramework);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("page-ranges")))
  {
    -[PKPrintSettings pageRanges](self, "pageRanges");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4;
    v17 = __Block_byref_object_dispose__4;
    v18 = 0;
    -[PKPrintSettings keyedNameToVisitName:](self, "keyedNameToVisitName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __32__PKPrintSettings_objectForKey___block_invoke;
      v10[3] = &unk_24E6CDEE8;
      v11 = v6;
      v12 = &v13;
      UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v10);
      v8 = v11;
    }
    else
    {
      _PKLogCategory(PKLogCategoryFramework);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_ERROR, "No mapping to visit key %@", buf, 0xCu);
      }
    }

    v5 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v5;
}

void __32__PKPrintSettings_objectForKey___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  void (**v8)(id, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a3;
  if (objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v8[2](v8, *a5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (PKPaper)paper
{
  return (PKPaper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPaper:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSURL)printerInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterInfoURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSURL)printerSuppliesURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterSuppliesURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)annotationsImaged
{
  return self->_annotationsImaged;
}

- (void)setAnnotationsImaged:(BOOL)a3
{
  self->_annotationsImaged = a3;
}

- (int)copies
{
  return self->_copies;
}

- (void)setCopies:(int)a3
{
  self->_copies = a3;
}

- (NSString)documentPassword
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDocumentPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)duplex
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDuplex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)finishingTemplate
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFinishingTemplate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)finishings
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFinishings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)inputSlot
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputSlot:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)mediaType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMediaType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)jobAccountID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setJobAccountID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)jobName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setJobName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)orientation
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOrientation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)outputBin
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setOutputBin:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSString)outputMode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOutputMode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)pageScale
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPageScale:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)pageStackOrder
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPageStackOrder:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)printQuality
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPrintQuality:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)thumbnailPosition
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setThumbnailPosition:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSString)jobPresetName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setJobPresetName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSString)fileType
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFileType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSArray)pageRanges_asStringArray
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPageRanges_asStringArray:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageRanges_asStringArray, 0);
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong((id *)&self->_jobPresetName, 0);
  objc_storeStrong((id *)&self->_thumbnailPosition, 0);
  objc_storeStrong((id *)&self->_printQuality, 0);
  objc_storeStrong((id *)&self->_pageStackOrder, 0);
  objc_storeStrong((id *)&self->_pageScale, 0);
  objc_storeStrong((id *)&self->_outputMode, 0);
  objc_storeStrong((id *)&self->_outputBin, 0);
  objc_storeStrong((id *)&self->_orientation, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
  objc_storeStrong((id *)&self->_jobAccountID, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_inputSlot, 0);
  objc_storeStrong((id *)&self->_finishings, 0);
  objc_storeStrong((id *)&self->_finishingTemplate, 0);
  objc_storeStrong((id *)&self->_duplex, 0);
  objc_storeStrong((id *)&self->_documentPassword, 0);
  objc_storeStrong((id *)&self->_printerSuppliesURL, 0);
  objc_storeStrong((id *)&self->_printerInfoURL, 0);
  objc_storeStrong((id *)&self->_paper, 0);
}

@end
