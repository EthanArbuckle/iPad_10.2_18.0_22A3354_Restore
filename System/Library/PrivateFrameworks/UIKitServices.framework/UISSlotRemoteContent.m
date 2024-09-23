@implementation UISSlotRemoteContent

- (UISSlotRemoteContent)initWithContentSize:(CGSize)a3 contentScale:(unsigned __int8)a4 localImage:(CGImage *)a5 toLayerContext:(id *)a6
{
  CGFloat height;
  CGFloat width;
  UISSlotRemoteContent *v12;
  UISSlotRemoteContent *v13;
  id v14;
  char v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v20;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)UISSlotRemoteContent;
  v12 = -[UISSlotRemoteContent init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_contentScale = a4;
    v12->_contentSize.width = width;
    v12->_contentSize.height = height;
    v14 = *a6;
    v15 = 1;
    v16 = 0;
    while (1)
    {
      v17 = v15;
      if (!v14)
        v14 = +[UISSlotRemoteContent newLayerContext](UISSlotRemoteContent, "newLayerContext");
      v18 = objc_msgSend(v14, "createSlot");
      v13->_slotID = v18;
      if ((_DWORD)v18)
        break;

      v15 = 0;
      v14 = 0;
      if ((v17 & 1) == 0)
        goto LABEL_9;
    }
    objc_msgSend(v14, "setObject:forSlot:", a5, v18);
    v16 = v14;
LABEL_9:
    objc_storeStrong(a6, v16);
    if (!v13->_slotID)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("UISSlotRemoteContent.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_slotID"));

    }
  }
  return v13;
}

- (UISSlotRemoteContent)initWithCoder:(id)a3
{
  id v4;
  UISSlotRemoteContent *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISSlotRemoteContent;
  v5 = -[UISSlotRemoteContent init](&v10, sel_init);
  if (v5)
  {
    v5->_contentScale = objc_msgSend(v4, "decodeIntForKey:", CFSTR("scale"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sizeWidth"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sizeHeight"));
    v5->_contentSize.width = v7;
    v5->_contentSize.height = v8;
    v5->_slotID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slotID"));
  }

  return v5;
}

- (unsigned)contentScale
{
  return self->_contentScale;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)deleteFromLayerContext:(id)a3
{
  objc_msgSend(a3, "deleteSlot:", self->_slotID);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contentScale;
  id v5;

  contentScale = self->_contentScale;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", contentScale, CFSTR("scale"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sizeWidth"), self->_contentSize.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sizeHeight"), self->_contentSize.height);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_slotID, CFSTR("slotID"));

}

- (unint64_t)hash
{
  return (unint64_t)self->_contentSize.width ^ self->_contentScale ^ (unint64_t)self->_contentSize.height ^ self->_slotID;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  BOOL v6;

  v4 = (double *)a3;
  objc_opt_class();
  v6 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_contentScale == *((unsigned __int8 *)v4 + 8)
    && (self->_contentSize.width == v4[2] ? (v5 = self->_contentSize.height == v4[3]) : (v5 = 0), v5)
    && self->_slotID == *((_DWORD *)v4 + 8);

  return v6;
}

- (id)image
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", self->_slotID);
}

- (BOOL)isRemote
{
  return 1;
}

+ (id)newLayerContext
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD2A28];
  v7[0] = *MEMORY[0x1E0CD2A40];
  v7[1] = v2;
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAA0];
  v3 = (void *)MEMORY[0x1E0CD2720];
  v7[2] = *MEMORY[0x1E0CD2A10];
  v8[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteContextWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setCommitPriority:", 1000);
  return v5;
}

- (id)newTouchAuthenticationSpecificationWithAuthenticationMessageContext:(unint64_t)a3 backgroundStatisticsRegion:(id)a4 backgroundStatisticsForeground:(float)a5 backgroundStatisticsPassingContrast:(float)a6 backgroundStatisticsFailingContrast:(float)a7 hitTestInformationMask:(unint64_t)a8 initialSampleEvent:(int64_t)a9 secureName:(unsigned int)a10
{
  _QWORD v11[8];
  float v12;
  float v13;
  float v14;
  unsigned int v15;
  $BEA516A46C1BA1F84587E5D243A711F7 v16;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __275__UISSlotRemoteContent_newTouchAuthenticationSpecificationWithAuthenticationMessageContext_backgroundStatisticsRegion_backgroundStatisticsForeground_backgroundStatisticsPassingContrast_backgroundStatisticsFailingContrast_hitTestInformationMask_initialSampleEvent_secureName___block_invoke;
  v11[3] = &unk_1E2CAFAD0;
  v11[4] = self;
  v11[5] = a3;
  v16 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v11[6] = a8;
  v11[7] = a9;
  v15 = a10;
  objc_msgSend(MEMORY[0x1E0D00DF8], "buildSpecification:", v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __275__UISSlotRemoteContent_newTouchAuthenticationSpecificationWithAuthenticationMessageContext_backgroundStatisticsRegion_backgroundStatisticsForeground_backgroundStatisticsPassingContrast_backgroundStatisticsFailingContrast_hitTestInformationMask_initialSampleEvent_secureName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32);
  v7 = a2;
  objc_msgSend(v7, "setSlotID:", v3);
  objc_msgSend(v7, "setAuthenticationMessageContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setBackgroundStatisticsRegion:", *(_QWORD *)(a1 + 80));
  LODWORD(v4) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v7, "setBackgroundStatisticsForeground:", v4);
  LODWORD(v5) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v7, "setBackgroundStatisticsPassingContrast:", v5);
  LODWORD(v6) = *(_DWORD *)(a1 + 72);
  objc_msgSend(v7, "setBackgroundStatisticsFailingContrast:", v6);
  objc_msgSend(v7, "setHitTestInformationMask:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setInitialSampleEvent:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "setSecureName:", *(unsigned int *)(a1 + 76));

}

- (BOOL)shouldReplaceExistingContent
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)transferFromLayerContext:(id)a3 toLayerContextWithId:(unint64_t)a4
{
  objc_msgSend(a3, "transferSlot:toContextWithId:", self->_slotID, a4);
}

- (unsigned)slotID
{
  return self->_slotID;
}

@end
