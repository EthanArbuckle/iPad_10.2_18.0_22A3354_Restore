@implementation _SSBDatabaseStatus

- (_SSBDatabaseStatus)initWithDatabaseStatus:(DatabaseStatus *)a3
{
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SSBDatabaseStatus;
  v4 = -[_SSBDatabaseStatus init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    std::vector<SafeBrowsing::DatabaseStatus::Database>::__vdeallocate((uint64_t *)v4 + 1);
    *(_OWORD *)(v5 + 8) = *(_OWORD *)&a3->m_databases.__begin_;
    *((_QWORD *)v5 + 3) = a3->m_databases.__end_cap_.__value_;
    a3->m_databases.__begin_ = 0;
    a3->m_databases.__end_ = 0;
    a3->m_databases.__end_cap_.__value_ = 0;
    v6 = v5;
  }

  return (_SSBDatabaseStatus *)v5;
}

- (unint64_t)databaseCount
{
  return 0x6DB6DB6DB6DB6DB7
       * ((self->_databaseStatus.m_databases.__end_ - self->_databaseStatus.m_databases.__begin_) >> 3);
}

- (id)nameOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t *v12;

  v4 = *((_QWORD *)self + 1);
  v5 = 0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    v4 = v7[1];
    v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = (uint64_t *)(v4 + 56 * a3);
    if (*((char *)v12 + 23) < 0)
      v12 = (uint64_t *)*v12;
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
  }
  return self;
}

- (unint64_t)sizeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)(self + 8);
  v5 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(self + 16) - v4) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    v4 = *(_QWORD *)(v7 + 8);
    v5 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(v7 + 16) - v4) >> 3);
  }
  if (v5 > a3)
    return *(_QWORD *)(v4 + 56 * a3 + 24);
  __break(1u);
  return self;
}

- (unsigned)hashCountOfDatabaseAtIndex:(unint64_t)a3
{
  Database *begin;
  unint64_t v5;
  _SSBDatabaseStatus *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  begin = self->_databaseStatus.m_databases.__begin_;
  v5 = 0x6DB6DB6DB6DB6DB7 * ((self->_databaseStatus.m_databases.__end_ - begin) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    begin = v7->_databaseStatus.m_databases.__begin_;
    v5 = 0x6DB6DB6DB6DB6DB7 * ((v7->_databaseStatus.m_databases.__end_ - begin) >> 3);
  }
  if (v5 <= a3)
    __break(1u);
  else
    LODWORD(self) = *((_DWORD *)begin + 14 * a3 + 8);
  return self;
}

- (id)lastUpdateTimeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = *((_QWORD *)self + 1);
  v5 = 0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    v4 = v7[1];
    v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = (unsigned __int128)(*(uint64_t *)(v4 + 56 * a3 + 40) * (__int128)0x431BDE82D7B634DBLL) >> 64;
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(uint64_t)((v12 >> 18) + ((unint64_t)v12 >> 63)));
  }
  return self;
}

- (id)nextPollingTimeOfDatabaseAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = *((_QWORD *)self + 1);
  v5 = 0x6DB6DB6DB6DB6DB7 * ((*((_QWORD *)self + 2) - v4) >> 3);
  if (v5 <= a3)
  {
    v7 = self;
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", *MEMORY[0x1E0C99858], CFSTR("-[%@ %@]"), v10, v11);

    v4 = v7[1];
    v5 = 0x6DB6DB6DB6DB6DB7 * ((v7[2] - v4) >> 3);
  }
  if (v5 <= a3)
  {
    __break(1u);
  }
  else
  {
    v12 = (unsigned __int128)(*(uint64_t *)(v4 + 56 * a3 + 48) * (__int128)0x431BDE82D7B634DBLL) >> 64;
    return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(uint64_t)((v12 >> 18) + ((unint64_t)v12 >> 63)));
  }
  return self;
}

- (void).cxx_destruct
{
  DatabaseStatus *p_databaseStatus;

  p_databaseStatus = &self->_databaseStatus;
  std::vector<SafeBrowsing::DatabaseStatus::Database>::__destroy_vector::operator()[abi:sn180100]((void ***)&p_databaseStatus);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
