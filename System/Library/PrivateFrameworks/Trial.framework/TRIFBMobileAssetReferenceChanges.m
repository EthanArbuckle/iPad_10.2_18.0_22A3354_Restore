@implementation TRIFBMobileAssetReferenceChanges

- (void)replaceType:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeType = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementType = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveType
{
  self->_changeTypeType = 0;
}

- (void)replaceSpecifier:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeSpecifier = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementSpecifier = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveSpecifier
{
  self->_changeTypeSpecifier = 0;
}

- (void)replaceVersion:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeVersion = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementVersion = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveVersion
{
  self->_changeTypeVersion = 0;
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2569, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

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

@end
