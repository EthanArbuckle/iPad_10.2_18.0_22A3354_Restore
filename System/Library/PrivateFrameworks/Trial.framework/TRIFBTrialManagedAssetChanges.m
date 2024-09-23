@implementation TRIFBTrialManagedAssetChanges

- (void)replacePath:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypePath = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1712, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementPath = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitPath
{
  self->_changeTypePath = 2;
}

- (void)preservePath
{
  self->_changeTypePath = 0;
}

- (void)replaceFileType:(unsigned __int8)a3
{
  self->_changeTypeFileType = 1;
  self->_replacementFileType = a3;
}

- (void)omitFileType
{
  self->_changeTypeFileType = 2;
}

- (void)preserveFileType
{
  self->_changeTypeFileType = 0;
}

- (void)replaceAssetId:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeAssetId = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1756, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementAssetId = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveAssetId
{
  self->_changeTypeAssetId = 0;
}

- (void)replaceCloudKitMetadataWithTreatment:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1778, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementCloudKitMetadataType = 257;
  self->_replacementCloudKitMetadata = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceCloudKitMetadataWithAsset:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1785, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementCloudKitMetadataType = 258;
  self->_replacementCloudKitMetadata = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveCloudKitMetadata
{
  self->_changeTypeCloudKitMetadata = 0;
}

- (void)replaceIsOnDemand:(BOOL)a3
{
  self->_changeTypeIsOnDemand = 1;
  self->_replacementIsOnDemand = a3;
}

- (void)omitIsOnDemand
{
  self->_changeTypeIsOnDemand = 2;
}

- (void)preserveIsOnDemand
{
  self->_changeTypeIsOnDemand = 0;
}

- (void)replaceDownloadSize:(unint64_t)a3
{
  self->_changeTypeDownloadSize = 1;
  self->_replacementDownloadSize = a3;
}

- (void)omitDownloadSize
{
  self->_changeTypeDownloadSize = 2;
}

- (void)preserveDownloadSize
{
  self->_changeTypeDownloadSize = 0;
}

- (void)replaceAssetName:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeAssetName = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 1847, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementAssetName = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitAssetName
{
  self->_changeTypeAssetName = 2;
}

- (void)preserveAssetName
{
  self->_changeTypeAssetName = 0;
}

- (void)replaceHasOnDemandFlag:(BOOL)a3
{
  self->_changeTypeHasOnDemandFlag = 1;
  self->_replacementHasOnDemandFlag = a3;
}

- (void)omitHasOnDemandFlag
{
  self->_changeTypeHasOnDemandFlag = 2;
}

- (void)preserveHasOnDemandFlag
{
  self->_changeTypeHasOnDemandFlag = 0;
}

@end
