@implementation _WBSBiomeStream

- (_WBSBiomeStream)initWithIdentifier:(id)a3
{
  id v5;
  _WBSBiomeStream *v6;
  _WBSBiomeStream *v7;
  _WBSBiomeStream *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_WBSBiomeStream;
  v6 = -[_WBSBiomeStream init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    -[_WBSBiomeStream _fetchStream](v7, "_fetchStream");
    v8 = v7;
  }

  return v7;
}

- (void)_fetchStream
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch stream with identifier: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BMSource)source
{
  return self->_source;
}

- (BMPruner)pruner
{
  return self->_pruner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
