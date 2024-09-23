@implementation PXFeedPPTConfiguration

- (PXFeedPPTConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedPPTConfiguration.m"), 43, CFSTR("%s is not available as initializer"), "-[PXFeedPPTConfiguration init]");

  abort();
}

- (PXFeedPPTConfiguration)initWithPreset:(unint64_t)a3
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  PXStoryMemoryFeedConfiguration *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PXStoryMemoryFeedConfiguration *v13;
  PXStoryMemoryFeedConfiguration *v14;
  void *v15;
  uint64_t v16;
  PXStoryMemoryFeedConfiguration *v17;
  PXFeedPPTConfiguration *v18;
  void *v20;

  if (a3 > 4)
    v6 = CFSTR("??");
  else
    v6 = off_1E5144A40[a3];
  v7 = v6;
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedPPTConfiguration.m"), 55, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2uLL:
      v9 = [PXStoryMemoryFeedConfiguration alloc];
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PXStoryMemoryFeedConfiguration initWithSyntheticSectionCount:numberOfItemsPerSection:photoLibrary:layoutKind:](v9, "initWithSyntheticSectionCount:numberOfItemsPerSection:photoLibrary:layoutKind:", 5, 20, v10, 1);
      goto LABEL_10;
    case 3uLL:
      v13 = [PXStoryMemoryFeedConfiguration alloc];
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v10;
      v16 = 1;
      goto LABEL_9;
    case 4uLL:
      v17 = [PXStoryMemoryFeedConfiguration alloc];
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v15 = v10;
      v16 = 2;
LABEL_9:
      v11 = -[PXStoryMemoryFeedConfiguration initWithMemoriesInPhotoLibrary:layoutKind:viewControllerSetupBlock:](v14, "initWithMemoriesInPhotoLibrary:layoutKind:viewControllerSetupBlock:", v15, v16, 0);
LABEL_10:
      v12 = (void *)v11;

      break;
    default:
      v12 = 0;
      break;
  }
  v18 = -[PXFeedPPTConfiguration initWithName:feedConfiguration:](self, "initWithName:feedConfiguration:", v8, v12);

  return v18;
}

- (PXFeedPPTConfiguration)initWithName:(id)a3 feedConfiguration:(id)a4
{
  id v6;
  id v7;
  PXFeedPPTConfiguration *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  PXFeedConfiguration *feedConfiguration;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXFeedPPTConfiguration;
  v8 = -[PXFeedPPTConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    feedConfiguration = v8->_feedConfiguration;
    v8->_feedConfiguration = (PXFeedConfiguration *)v11;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (PXFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)configurationsForPreset:(unint64_t)a3 testOptions:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD aBlock[4];
  id v18;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke;
  aBlock[3] = &unk_1E5144A20;
  v7 = v5;
  v18 = v7;
  v8 = _Block_copy(aBlock);
  v9 = v8;
  if (a3 == 1)
  {
    v12 = v6;
    v13 = 3221225472;
    v14 = __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke_2;
    v15 = &unk_1E5141560;
    v16 = v8;
    do
      v14((uint64_t)&v12, a3++);
    while (a3 != 5);

  }
  else
  {
    (*((void (**)(void *, unint64_t))v8 + 2))(v8, a3);
  }
  v10 = (void *)objc_msgSend(v7, "copy", v12, v13);

  return v10;
}

void __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  PXFeedPPTConfiguration *v3;

  v2 = *(void **)(a1 + 32);
  v3 = -[PXFeedPPTConfiguration initWithPreset:]([PXFeedPPTConfiguration alloc], "initWithPreset:", a2);
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 != 1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
