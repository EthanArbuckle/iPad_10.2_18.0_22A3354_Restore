@implementation TRIFBFactorLevelChanges

- (void)replaceName:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeName = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementName = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveName
{
  self->_changeTypeName = 0;
}

- (void)replaceLevelWithBoolVal:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3941, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 257;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceLevelWithStringVal:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3948, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 258;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceLevelWithInt64Val:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3955, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 259;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceLevelWithDoubleVal:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 260;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceLevelWithTrialAssetVal:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 261;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)replaceLevelWithMaRefVal:(id)a3
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3976, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 262;
  self->_replacementLevel = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveLevel
{
  self->_changeTypeLevel = 0;
}

- (void)replaceMetadata:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeMetadata = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 3996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementMetadata = objc_msgSend(v5, "unsignedIntValue");

}

- (void)preserveMetadata
{
  self->_changeTypeMetadata = 0;
}

- (void)replaceCacheKey:(unsigned int)a3
{
  self->_changeTypeCacheKey = 1;
  self->_replacementCacheKey = a3;
}

- (void)omitCacheKey
{
  self->_changeTypeCacheKey = 2;
}

- (void)preserveCacheKey
{
  self->_changeTypeCacheKey = 0;
}

- (void)replaceAlias:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeAlias = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4036, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementAlias = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitAlias
{
  self->_changeTypeAlias = 2;
}

- (void)preserveAlias
{
  self->_changeTypeAlias = 0;
}

- (void)replaceFactorNamespaceName:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeFactorNamespaceName = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4059, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementFactorNamespaceName = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitFactorNamespaceName
{
  self->_changeTypeFactorNamespaceName = 2;
}

- (void)preserveFactorNamespaceName
{
  self->_changeTypeFactorNamespaceName = 0;
}

- (void)replaceFactorId:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  self->_changeTypeFactorId = 1;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIFBFastFactorLevels_generated.mm"), 4082, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ofs"));

    v5 = 0;
  }
  self->_replacementFactorId = objc_msgSend(v5, "unsignedIntValue");

}

- (void)omitFactorId
{
  self->_changeTypeFactorId = 2;
}

- (void)preserveFactorId
{
  self->_changeTypeFactorId = 0;
}

- (void)replaceNamespaceId:(unsigned int)a3
{
  self->_changeTypeNamespaceId = 1;
  self->_replacementNamespaceId = a3;
}

- (void)omitNamespaceId
{
  self->_changeTypeNamespaceId = 2;
}

- (void)preserveNamespaceId
{
  self->_changeTypeNamespaceId = 0;
}

@end
