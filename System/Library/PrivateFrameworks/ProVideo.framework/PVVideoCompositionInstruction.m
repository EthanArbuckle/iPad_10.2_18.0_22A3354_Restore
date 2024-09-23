@implementation PVVideoCompositionInstruction

- (PVVideoCompositionInstruction)init
{
  char *v2;
  PVVideoCompositionInstruction *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  NSArray *m_requiredSourceSampleDataTrackIDs;
  PVInstructionGraphNode *m_outputIGNode;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PVVideoCompositionInstruction;
  v2 = -[PVVideoCompositionInstruction init](&v10, sel_init);
  v3 = (PVVideoCompositionInstruction *)v2;
  if (v2)
  {
    v4 = *MEMORY[0x1E0CA2E50];
    v5 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    *(_OWORD *)(v2 + 24) = v5;
    *(_OWORD *)(v2 + 8) = v4;
    *((_WORD *)v2 + 28) = 0;
    v6 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;

    m_requiredSourceSampleDataTrackIDs = v3->m_requiredSourceSampleDataTrackIDs;
    v3->m_requiredSourceSampleDataTrackIDs = 0;

    v3->m_passthroughTrackID = 0;
    m_outputIGNode = v3->m_outputIGNode;
    v3->m_outputIGNode = 0;

  }
  return v3;
}

- (void)setOutputNode:(id)a3
{
  NSArray *m_requiredSourceTrackIDs;
  NSArray *m_requiredSourceSampleDataTrackIDs;
  PVInstructionGraphNode *m_outputIGNode;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->m_outputIGNode, a3);
  m_requiredSourceTrackIDs = self->m_requiredSourceTrackIDs;
  self->m_requiredSourceTrackIDs = 0;

  m_requiredSourceSampleDataTrackIDs = self->m_requiredSourceSampleDataTrackIDs;
  self->m_requiredSourceSampleDataTrackIDs = 0;

  self->m_passthroughTrackID = 0;
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
  {
    -[PVInstructionGraphNode requiredSourceTrackIDs](m_outputIGNode, "requiredSourceTrackIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->m_requiredSourceTrackIDs;
    self->m_requiredSourceTrackIDs = v9;

    -[PVInstructionGraphNode requiredSourceSampleDataTrackIDs](self->m_outputIGNode, "requiredSourceSampleDataTrackIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->m_requiredSourceSampleDataTrackIDs;
    self->m_requiredSourceSampleDataTrackIDs = v12;

    if (+[PVEnvironment PV_ENABLE_CHECK_PASSTHRUS](PVEnvironment, "PV_ENABLE_CHECK_PASSTHRUS")
      && -[PVInstructionGraphNode isPassthru](self->m_outputIGNode, "isPassthru"))
    {
      -[NSArray objectAtIndex:](self->m_requiredSourceTrackIDs, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self->m_passthroughTrackID = objc_msgSend(v14, "intValue");

    }
  }

}

- (id)videoInstructionDescription
{
  __int128 v3;
  CFDictionaryRef v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PVInstructionGraphNode *m_outputIGNode;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CMTimeRange range;
  _QWORD v18[8];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->m_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->m_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->m_timeRange.duration.timescale;
  v4 = CMTimeRangeCopyAsDictionary(&range, 0);
  v19[0] = v4;
  v18[0] = CFSTR("timeRange");
  v18[1] = CFSTR("enablePostPorcessing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->m_enablePostProcessing);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("containsTweening");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->m_containsTweening);
  v20 = objc_claimAutoreleasedReturnValue();
  v18[3] = CFSTR("isFreezeFrame");
  v15 = (void *)v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFreezeFrame);
  v21 = objc_claimAutoreleasedReturnValue();
  v18[4] = CFSTR("passthroughTrackID");
  v14 = (void *)v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->m_passthroughTrackID);
  v22 = objc_claimAutoreleasedReturnValue();
  v18[5] = CFSTR("requiredSourceTrackIDs");
  v13 = (void *)v22;
  -[PVVideoCompositionInstruction requiredSourceTrackIDs](self, "requiredSourceTrackIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PVVideoCompositionInstruction requiredSourceTrackIDs](self, "requiredSourceTrackIDs");
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v6;
  v18[6] = CFSTR("requiredSourceSampleDataTrackIDs");
  -[PVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[PVVideoCompositionInstruction requiredSourceSampleDataTrackIDs](self, "requiredSourceSampleDataTrackIDs");
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  v18[7] = CFSTR("instructionGraph");
  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
    -[PVInstructionGraphNode instructionGraphNodeDescription](m_outputIGNode, "instructionGraphNodeDescription");
  else
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CFRelease(v4);
  return v11;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PVVideoCompositionInstruction videoInstructionDescription](self, "videoInstructionDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)loadInstructionGraphNodes:(HGRef<PVInstructionGraphContext>)a3
{
  PVInstructionGraphNode *m_outputIGNode;
  uint64_t v4;
  uint64_t v5;

  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
  {
    v4 = *(_QWORD *)a3.m_Obj;
    v5 = v4;
    if (v4)
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v4 + 16))(v4, a2);
    -[PVInstructionGraphNode loadIGNode:](m_outputIGNode, "loadIGNode:", &v5);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
  }
}

- (void)unloadInstructionGraphNodes
{
  PVInstructionGraphNode *m_outputIGNode;

  m_outputIGNode = self->m_outputIGNode;
  if (m_outputIGNode)
    -[PVInstructionGraphNode unloadIGNode](m_outputIGNode, "unloadIGNode");
}

- (id)copyWithZone:(_NSZone *)a3
{
  PVVideoCompositionInstruction *v4;
  void *v5;
  _OWORD v7[6];

  v4 = -[PVVideoCompositionInstruction init](+[PVVideoCompositionInstruction allocWithZone:](PVVideoCompositionInstruction, "allocWithZone:", a3), "init");
  -[PVVideoCompositionInstruction timeRange](self, "timeRange");
  v7[0] = v7[3];
  v7[1] = v7[4];
  v7[2] = v7[5];
  -[PVVideoCompositionInstruction setTimeRange:](v4, "setTimeRange:", v7);
  -[PVVideoCompositionInstruction setEnablePostProcessing:](v4, "setEnablePostProcessing:", -[PVVideoCompositionInstruction enablePostProcessing](self, "enablePostProcessing"));
  -[PVVideoCompositionInstruction setContainsTweening:](v4, "setContainsTweening:", -[PVVideoCompositionInstruction containsTweening](self, "containsTweening"));
  -[PVVideoCompositionInstruction outputNode](self, "outputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PVVideoCompositionInstruction setOutputNode:](v4, "setOutputNode:", v5);

  return v4;
}

- ($202A6A048D39AE170264FF71A65A9479)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->m_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->m_timeRange.start.epoch = v4;
  *(_OWORD *)&self->m_timeRange.start.value = v3;
}

- (BOOL)enablePostProcessing
{
  return self->m_enablePostProcessing;
}

- (void)setEnablePostProcessing:(BOOL)a3
{
  self->m_enablePostProcessing = a3;
}

- (BOOL)containsTweening
{
  return self->m_containsTweening;
}

- (void)setContainsTweening:(BOOL)a3
{
  self->m_containsTweening = a3;
}

- (NSArray)requiredSourceTrackIDs
{
  return self->m_requiredSourceTrackIDs;
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return self->m_requiredSourceSampleDataTrackIDs;
}

- (int)passthroughTrackID
{
  return self->m_passthroughTrackID;
}

- (PVInstructionGraphNode)outputNode
{
  return self->m_outputIGNode;
}

- (BOOL)isFreezeFrame
{
  return self->_isFreezeFrame;
}

- (void)setIsFreezeFrame:(BOOL)a3
{
  self->_isFreezeFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_outputIGNode, 0);
  objc_storeStrong((id *)&self->m_requiredSourceSampleDataTrackIDs, 0);
  objc_storeStrong((id *)&self->m_requiredSourceTrackIDs, 0);
}

@end
