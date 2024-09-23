@implementation TRIFBCloudKitTreatmentRecordAssetChanges

- (void)replaceContainer:(unsigned __int8)a3
{
  self->_changeTypeContainer = 1;
  self->_replacementContainer = a3;
}

- (void)omitContainer
{
  self->_changeTypeContainer = 2;
}

- (void)preserveContainer
{
  self->_changeTypeContainer = 0;
}

- (void)replaceTreatmentId:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeTreatmentId = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementTreatmentId = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveTreatmentId
{
  self->_changeTypeTreatmentId = 0;
}

- (void)replaceAssetIndex:(unsigned int)a3
{
  self->_changeTypeAssetIndex = 1;
  self->_replacementAssetIndex = a3;
}

- (void)omitAssetIndex
{
  self->_changeTypeAssetIndex = 2;
}

- (void)preserveAssetIndex
{
  self->_changeTypeAssetIndex = 0;
}

- (void)replaceHasCkIndex:(BOOL)a3
{
  self->_changeTypeHasCkIndex = 1;
  self->_replacementHasCkIndex = a3;
}

- (void)omitHasCkIndex
{
  self->_changeTypeHasCkIndex = 2;
}

- (void)preserveHasCkIndex
{
  self->_changeTypeHasCkIndex = 0;
}

@end
