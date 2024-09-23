@implementation TPSContextualBiomeEventBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)bookmarkWithSinkBookmark:(id)a3
{
  id v3;
  TPSContextualBiomeEventBookmark *v4;

  v3 = a3;
  v4 = -[TPSContextualEventBookmark initWithDataVersion:]([TPSContextualBiomeEventBookmark alloc], "initWithDataVersion:", 1);
  -[TPSContextualBiomeEventBookmark setSinkBookmark:](v4, "setSinkBookmark:", v3);

  return v4;
}

- (TPSContextualBiomeEventBookmark)initWithCoder:(id)a3
{
  id v4;
  TPSContextualBiomeEventBookmark *v5;
  void *v6;
  uint64_t v7;
  BMBookmark *sinkBookmark;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEventBookmark;
  v5 = -[TPSContextualEventBookmark initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchiveObjectWithData:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      sinkBookmark = v5->_sinkBookmark;
      v5->_sinkBookmark = (BMBookmark *)v7;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  BMBookmark *sinkBookmark;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEventBookmark;
  -[TPSContextualEventBookmark encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  sinkBookmark = self->_sinkBookmark;
  if (sinkBookmark)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sinkBookmark, 0, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v6)
    {
      objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bookmarkData"));
    }
    else
    {
      +[TPSLogger default](TPSLogger, "default");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[TPSContextualBiomeEventBookmark encodeWithCoder:].cold.1();

    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualBiomeEventBookmark;
  v4 = -[TPSContextualEventBookmark copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSinkBookmark:", self->_sinkBookmark);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)TPSContextualBiomeEventBookmark;
  -[TPSContextualEventBookmark description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSContextualBiomeEventBookmark sinkBookmark](self, "sinkBookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("bookmarkData"), v6);

  return v5;
}

- (BMBookmark)sinkBookmark
{
  return self->_sinkBookmark;
}

- (void)setSinkBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_sinkBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sinkBookmark, 0);
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_19A906000, v0, v1, "Error secureUnarchiving key %@, exception: %@", v2, v3, v4, v5, 2u);
}

- (void)encodeWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_19A906000, v0, v1, "Failed to archive key %@, error: %@", v2, v3, v4, v5, 2u);
}

@end
