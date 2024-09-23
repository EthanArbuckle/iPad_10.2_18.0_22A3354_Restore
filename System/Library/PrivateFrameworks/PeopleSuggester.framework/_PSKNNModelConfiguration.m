@implementation _PSKNNModelConfiguration

- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9
{
  return -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:](self, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:shouldExcludeInteractionBlock:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (_PSKNNModelConfiguration)initWithInteractionMechanisms:(id)a3 interactionCountMaxDepths:(id)a4 interactionHistoryRelativeStartDates:(id)a5 bundleIds:(id)a6 modelType:(int64_t)a7 clusterPruneThreshold:(unint64_t)a8 modelName:(id)a9 shouldExcludeInteractionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  _PSKNNModelConfiguration *v19;
  _PSKNNModelConfiguration *v20;
  uint64_t v21;
  id shouldExcludeInteractionBlock;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_PSKNNModelConfiguration;
  v19 = -[_PSKNNModelConfiguration init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_interactionMechanisms, a3);
    objc_storeStrong((id *)&v20->_interactionCountMaxDepths, a4);
    objc_storeStrong((id *)&v20->_interactionHistoryRelativeStartDates, a5);
    objc_storeStrong((id *)&v20->_bundleIds, a6);
    v20->_modelType = a7;
    v20->_clusterPruneThreshold = a8;
    objc_storeStrong((id *)&v20->_modelName, a9);
    v21 = MEMORY[0x1A1AFCBF8](v18);
    shouldExcludeInteractionBlock = v20->_shouldExcludeInteractionBlock;
    v20->_shouldExcludeInteractionBlock = (id)v21;

  }
  return v20;
}

- (NSArray)interactionCountMaxDepths
{
  return self->_interactionCountMaxDepths;
}

- (void)setInteractionCountMaxDepths:(id)a3
{
  objc_storeStrong((id *)&self->_interactionCountMaxDepths, a3);
}

- (NSArray)interactionMechanisms
{
  return self->_interactionMechanisms;
}

- (void)setInteractionMechanisms:(id)a3
{
  objc_storeStrong((id *)&self->_interactionMechanisms, a3);
}

- (NSArray)interactionHistoryRelativeStartDates
{
  return self->_interactionHistoryRelativeStartDates;
}

- (void)setInteractionHistoryRelativeStartDates:(id)a3
{
  objc_storeStrong((id *)&self->_interactionHistoryRelativeStartDates, a3);
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIds, a3);
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (void)setModelType:(int64_t)a3
{
  self->_modelType = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (unint64_t)clusterPruneThreshold
{
  return self->_clusterPruneThreshold;
}

- (id)shouldExcludeInteractionBlock
{
  return self->_shouldExcludeInteractionBlock;
}

- (void)setShouldExcludeInteractionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldExcludeInteractionBlock, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_interactionHistoryRelativeStartDates, 0);
  objc_storeStrong((id *)&self->_interactionMechanisms, 0);
  objc_storeStrong((id *)&self->_interactionCountMaxDepths, 0);
}

@end
