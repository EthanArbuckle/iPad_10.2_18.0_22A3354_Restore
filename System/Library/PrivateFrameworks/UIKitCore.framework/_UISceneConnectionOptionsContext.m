@implementation _UISceneConnectionOptionsContext

- (NSDictionary)launchOptionsDictionary
{
  return self->_launchOptionsDictionary;
}

- (NSSet)unprocessedActions
{
  return self->_unprocessedActions;
}

- (void)setUnprocessedActions:(id)a3
{
  objc_storeStrong((id *)&self->_unprocessedActions, a3);
}

- (void)setLaunchOptionsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_launchOptionsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionPayloadStorage, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong((id *)&self->_unprocessedActions, 0);
  objc_storeStrong((id *)&self->_launchOptionsDictionary, 0);
}

- (void)_addCleanupBlock:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v9 = v3;
    if (v4)
    {
      v5 = _Block_copy(v3);
      objc_msgSend(v4, "setByAddingObject:", v5);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v5 = _Block_copy(v3);
      objc_msgSend(v7, "setWithObject:", v5);
    }
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v6;

    v3 = v9;
  }

}

- (uint64_t)definitionPayloadStorage
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

@end
