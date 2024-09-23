@implementation CPLMasterChange(BatchUploader)

- (BOOL)hasResourceOfType:()BatchUploader notInMasterChange:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];

  v6 = a4;
  objc_msgSend(a1, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__CPLMasterChange_BatchUploader__hasResourceOfType_notInMasterChange___block_invoke;
    v17[3] = &__block_descriptor_40_e28_B32__0__CPLResource_8Q16_B24l;
    v17[4] = a3;
    v10 = (void *)MEMORY[0x19AEC174C](v17);
    objc_msgSend(a1, "resources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v10);

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v6, "resources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "indexOfObjectPassingTest:", v10);

      v13 = v15 == 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
