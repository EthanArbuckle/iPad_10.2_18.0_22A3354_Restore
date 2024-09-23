@implementation TRIFBFactorMetadataKeyValueChanges

- (void)replaceKey:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeKey = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2954, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementKey = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveKey
{
  self->_changeTypeKey = 0;
}

- (void)replaceVal:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeVal = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 2973, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementVal = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveVal
{
  self->_changeTypeVal = 0;
}

@end
