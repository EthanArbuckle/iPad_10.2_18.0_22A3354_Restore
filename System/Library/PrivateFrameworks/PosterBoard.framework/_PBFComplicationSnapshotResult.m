@implementation _PBFComplicationSnapshotResult

- (_PBFComplicationSnapshotResult)initWithSnapshot:(id)a3 error:(id)a4
{
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _PBFComplicationSnapshotResult *v11;
  _PBFComplicationSnapshotResult *v12;
  _PBFComplicationSnapshotResult *result;
  void *v14;
  objc_super v15;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v10 = (void *)v9;
    v15.receiver = self;
    v15.super_class = (Class)_PBFComplicationSnapshotResult;
    v11 = -[_PBFComplicationSnapshotResult init](&v15, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_snapshot, a3);
      objc_storeStrong((id *)&v12->_error, a4);
    }

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("snapshot || error"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFComplicationSnapshotResult initWithSnapshot:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (_PBFComplicationSnapshotResult *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSError)error
{
  return self->_error;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithSnapshot:(const char *)a1 error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
