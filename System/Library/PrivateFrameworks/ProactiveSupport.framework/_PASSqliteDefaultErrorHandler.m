@implementation _PASSqliteDefaultErrorHandler

- (BOOL)handleSqliteError:(int)a3 error:(id)a4 onError:(id)a5 db:(id)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3 > 530)
  {
    if (a3 > 2569)
    {
      if (a3 > 4873)
      {
        if (a3 > 6153)
        {
          if (a3 <= 6665)
          {
            if (a3 == 6154)
            {
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_MMAP:onError:db:](self, "_handle_SQLITE_IOERR_MMAP:onError:db:", v10, v11, v12);
              goto LABEL_148;
            }
            if (a3 == 6410)
            {
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_GETTEMPPATH:onError:db:](self, "_handle_SQLITE_IOERR_GETTEMPPATH:onError:db:", v10, v11, v12);
              goto LABEL_148;
            }
          }
          else
          {
            switch(a3)
            {
              case 6666:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_CONVPATH:onError:db:](self, "_handle_SQLITE_IOERR_CONVPATH:onError:db:", v10, v11, v12);
                goto LABEL_148;
              case 6922:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_VNODE:onError:db:](self, "_handle_SQLITE_IOERR_VNODE:onError:db:", v10, v11, v12);
                goto LABEL_148;
              case 7178:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_AUTH:onError:db:](self, "_handle_SQLITE_IOERR_AUTH:onError:db:", v10, v11, v12);
                goto LABEL_148;
            }
          }
        }
        else if (a3 <= 5385)
        {
          if (a3 == 4874)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SHMSIZE:onError:db:](self, "_handle_SQLITE_IOERR_SHMSIZE:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
          if (a3 == 5130)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SHMLOCK:onError:db:](self, "_handle_SQLITE_IOERR_SHMLOCK:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 5386:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SHMMAP:onError:db:](self, "_handle_SQLITE_IOERR_SHMMAP:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 5642:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SEEK:onError:db:](self, "_handle_SQLITE_IOERR_SEEK:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 5898:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_DELETE_NOENT:onError:db:](self, "_handle_SQLITE_IOERR_DELETE_NOENT:onError:db:", v10, v11, v12);
              goto LABEL_148;
          }
        }
      }
      else if (a3 > 3593)
      {
        if (a3 <= 4105)
        {
          if (a3 == 3594)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_CHECKRESERVEDLOCK:onError:db:](self, "_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
          if (a3 == 3850)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_LOCK:onError:db:](self, "_handle_SQLITE_IOERR_LOCK:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 4106:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_CLOSE:onError:db:](self, "_handle_SQLITE_IOERR_CLOSE:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 4362:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_DIR_CLOSE:onError:db:](self, "_handle_SQLITE_IOERR_DIR_CLOSE:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 4618:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SHMOPEN:onError:db:](self, "_handle_SQLITE_IOERR_SHMOPEN:onError:db:", v10, v11, v12);
              goto LABEL_148;
          }
        }
      }
      else if (a3 <= 2825)
      {
        if (a3 == 2570)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_DELETE:onError:db:](self, "_handle_SQLITE_IOERR_DELETE:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
        if (a3 == 2579)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_ROWID:onError:db:](self, "_handle_SQLITE_CONSTRAINT_ROWID:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 2826:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_BLOCKED:onError:db:](self, "_handle_SQLITE_IOERR_BLOCKED:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 3082:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_NOMEM:onError:db:](self, "_handle_SQLITE_IOERR_NOMEM:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 3338:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_ACCESS:onError:db:](self, "_handle_SQLITE_IOERR_ACCESS:onError:db:", v10, v11, v12);
            goto LABEL_148;
        }
      }
    }
    else if (a3 > 1289)
    {
      if (a3 > 1810)
      {
        if (a3 <= 2066)
        {
          if (a3 == 1811)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_TRIGGER:onError:db:](self, "_handle_SQLITE_CONSTRAINT_TRIGGER:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
          if (a3 == 2058)
          {
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_UNLOCK:onError:db:](self, "_handle_SQLITE_IOERR_UNLOCK:onError:db:", v10, v11, v12);
            goto LABEL_148;
          }
        }
        else
        {
          switch(a3)
          {
            case 2067:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_UNIQUE:onError:db:](self, "_handle_SQLITE_CONSTRAINT_UNIQUE:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 2314:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_RDLOCK:onError:db:](self, "_handle_SQLITE_IOERR_RDLOCK:onError:db:", v10, v11, v12);
              goto LABEL_148;
            case 2323:
              v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_VTAB:onError:db:](self, "_handle_SQLITE_CONSTRAINT_VTAB:onError:db:", v10, v11, v12);
              goto LABEL_148;
          }
        }
      }
      else if (a3 <= 1545)
      {
        if (a3 == 1290)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_DIR_FSYNC:onError:db:](self, "_handle_SQLITE_IOERR_DIR_FSYNC:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
        if (a3 == 1299)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_NOTNULL:onError:db:](self, "_handle_SQLITE_CONSTRAINT_NOTNULL:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 1546:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_TRUNCATE:onError:db:](self, "_handle_SQLITE_IOERR_TRUNCATE:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 1555:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_PRIMARYKEY:onError:db:](self, "_handle_SQLITE_CONSTRAINT_PRIMARYKEY:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 1802:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_FSTAT:onError:db:](self, "_handle_SQLITE_IOERR_FSTAT:onError:db:", v10, v11, v12);
            goto LABEL_148;
        }
      }
    }
    else if (a3 > 786)
    {
      if (a3 <= 1033)
      {
        if (a3 == 787)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_FOREIGNKEY:onError:db:](self, "_handle_SQLITE_CONSTRAINT_FOREIGNKEY:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
        if (a3 == 1032)
        {
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_READONLY_DBMOVED:onError:db:](self, "_handle_SQLITE_READONLY_DBMOVED:onError:db:", v10, v11, v12);
          goto LABEL_148;
        }
      }
      else
      {
        switch(a3)
        {
          case 1034:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_FSYNC:onError:db:](self, "_handle_SQLITE_IOERR_FSYNC:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 1038:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN_CONVPATH:onError:db:](self, "_handle_SQLITE_CANTOPEN_CONVPATH:onError:db:", v10, v11, v12);
            goto LABEL_148;
          case 1043:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_FUNCTION:onError:db:](self, "_handle_SQLITE_CONSTRAINT_FUNCTION:onError:db:", v10, v11, v12);
            goto LABEL_148;
        }
      }
    }
    else if (a3 <= 775)
    {
      if (a3 == 531)
      {
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_COMMITHOOK:onError:db:](self, "_handle_SQLITE_CONSTRAINT_COMMITHOOK:onError:db:", v10, v11, v12);
        goto LABEL_148;
      }
      if (a3 == 539)
      {
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOTICE_RECOVER_ROLLBACK:onError:db:](self, "_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:onError:db:", v10, v11, v12);
        goto LABEL_148;
      }
    }
    else
    {
      switch(a3)
      {
        case 776:
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_READONLY_ROLLBACK:onError:db:](self, "_handle_SQLITE_READONLY_ROLLBACK:onError:db:", v10, v11, v12);
          goto LABEL_148;
        case 778:
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_WRITE:onError:db:](self, "_handle_SQLITE_IOERR_WRITE:onError:db:", v10, v11, v12);
          goto LABEL_148;
        case 782:
          v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN_FULLPATH:onError:db:](self, "_handle_SQLITE_CANTOPEN_FULLPATH:onError:db:", v10, v11, v12);
          goto LABEL_148;
      }
    }
LABEL_143:
    if (a3 >= 0x100)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16[0] = 67109890;
        v16[1] = a3;
        v17 = 2080;
        v18 = sqlite3_errstr(a3);
        v19 = 1024;
        v20 = a3;
        v21 = 2080;
        v22 = sqlite3_errstr(a3);
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Converting SQLite extended error type %i (%s) to primary error type %i (%s)", (uint8_t *)v16, 0x22u);
      }
      v13 = -[_PASSqliteDefaultErrorHandler handleSqliteError:error:onError:db:](self, "handleSqliteError:error:onError:db:", a3, v10, v11, v12);
    }
    else
    {
      v13 = -[_PASSqliteDefaultErrorHandler _handle_UNKNOWN_ERROR:onError:db:](self, "_handle_UNKNOWN_ERROR:onError:db:", v10, v11, v12);
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_ERROR:onError:db:](self, "_handle_SQLITE_ERROR:onError:db:", v10, v11, v12);
        break;
      case 2:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_INTERNAL:onError:db:](self, "_handle_SQLITE_INTERNAL:onError:db:", v10, v11, v12);
        break;
      case 3:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_PERM:onError:db:](self, "_handle_SQLITE_PERM:onError:db:", v10, v11, v12);
        break;
      case 4:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_ABORT:onError:db:](self, "_handle_SQLITE_ABORT:onError:db:", v10, v11, v12);
        break;
      case 5:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_BUSY:onError:db:](self, "_handle_SQLITE_BUSY:onError:db:", v10, v11, v12);
        break;
      case 6:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_LOCKED:onError:db:](self, "_handle_SQLITE_LOCKED:onError:db:", v10, v11, v12);
        break;
      case 7:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOMEM:onError:db:](self, "_handle_SQLITE_NOMEM:onError:db:", v10, v11, v12);
        break;
      case 8:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_READONLY:onError:db:](self, "_handle_SQLITE_READONLY:onError:db:", v10, v11, v12);
        break;
      case 9:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_INTERRUPT:onError:db:](self, "_handle_SQLITE_INTERRUPT:onError:db:", v10, v11, v12);
        break;
      case 10:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", v10, v11, v12);
        break;
      case 11:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CORRUPT:onError:db:](self, "_handle_SQLITE_CORRUPT:onError:db:", v10, v11, v12);
        break;
      case 12:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOTFOUND:onError:db:](self, "_handle_SQLITE_NOTFOUND:onError:db:", v10, v11, v12);
        break;
      case 13:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_FULL:onError:db:](self, "_handle_SQLITE_FULL:onError:db:", v10, v11, v12);
        break;
      case 14:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN:onError:db:](self, "_handle_SQLITE_CANTOPEN:onError:db:", v10, v11, v12);
        break;
      case 15:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_PROTOCOL:onError:db:](self, "_handle_SQLITE_PROTOCOL:onError:db:", v10, v11, v12);
        break;
      case 16:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_EMPTY:onError:db:](self, "_handle_SQLITE_EMPTY:onError:db:", v10, v11, v12);
        break;
      case 17:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_SCHEMA:onError:db:](self, "_handle_SQLITE_SCHEMA:onError:db:", v10, v11, v12);
        break;
      case 18:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_TOOBIG:onError:db:](self, "_handle_SQLITE_TOOBIG:onError:db:", v10, v11, v12);
        break;
      case 19:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT:onError:db:](self, "_handle_SQLITE_CONSTRAINT:onError:db:", v10, v11, v12);
        break;
      case 20:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_MISMATCH:onError:db:](self, "_handle_SQLITE_MISMATCH:onError:db:", v10, v11, v12);
        break;
      case 21:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_MISUSE:onError:db:](self, "_handle_SQLITE_MISUSE:onError:db:", v10, v11, v12);
        break;
      case 22:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOLFS:onError:db:](self, "_handle_SQLITE_NOLFS:onError:db:", v10, v11, v12);
        break;
      case 23:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_AUTH:onError:db:](self, "_handle_SQLITE_AUTH:onError:db:", v10, v11, v12);
        break;
      case 24:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_FORMAT:onError:db:](self, "_handle_SQLITE_FORMAT:onError:db:", v10, v11, v12);
        break;
      case 25:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_RANGE:onError:db:](self, "_handle_SQLITE_RANGE:onError:db:", v10, v11, v12);
        break;
      case 26:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOTADB:onError:db:](self, "_handle_SQLITE_NOTADB:onError:db:", v10, v11, v12);
        break;
      case 27:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOTICE:onError:db:](self, "_handle_SQLITE_NOTICE:onError:db:", v10, v11, v12);
        break;
      case 28:
        v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_WARNING:onError:db:](self, "_handle_SQLITE_WARNING:onError:db:", v10, v11, v12);
        break;
      default:
        switch(a3)
        {
          case 261:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_BUSY_RECOVERY:onError:db:](self, "_handle_SQLITE_BUSY_RECOVERY:onError:db:", v10, v11, v12);
            break;
          case 262:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_LOCKED_SHAREDCACHE:onError:db:](self, "_handle_SQLITE_LOCKED_SHAREDCACHE:onError:db:", v10, v11, v12);
            break;
          case 263:
          case 265:
          case 268:
          case 269:
          case 271:
          case 272:
          case 273:
          case 274:
          case 276:
          case 277:
          case 278:
          case 280:
          case 281:
          case 282:
            goto LABEL_143;
          case 264:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_READONLY_RECOVERY:onError:db:](self, "_handle_SQLITE_READONLY_RECOVERY:onError:db:", v10, v11, v12);
            break;
          case 266:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_READ:onError:db:](self, "_handle_SQLITE_IOERR_READ:onError:db:", v10, v11, v12);
            break;
          case 267:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CORRUPT_VTAB:onError:db:](self, "_handle_SQLITE_CORRUPT_VTAB:onError:db:", v10, v11, v12);
            break;
          case 270:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN_NOTEMPDIR:onError:db:](self, "_handle_SQLITE_CANTOPEN_NOTEMPDIR:onError:db:", v10, v11, v12);
            break;
          case 275:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CONSTRAINT_CHECK:onError:db:](self, "_handle_SQLITE_CONSTRAINT_CHECK:onError:db:", v10, v11, v12);
            break;
          case 279:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_AUTH_USER:onError:db:](self, "_handle_SQLITE_AUTH_USER:onError:db:", v10, v11, v12);
            break;
          case 283:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_NOTICE_RECOVER_WAL:onError:db:](self, "_handle_SQLITE_NOTICE_RECOVER_WAL:onError:db:", v10, v11, v12);
            break;
          case 284:
            v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_WARNING_AUTOINDEX:onError:db:](self, "_handle_SQLITE_WARNING_AUTOINDEX:onError:db:", v10, v11, v12);
            break;
          default:
            switch(a3)
            {
              case 516:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_ABORT_ROLLBACK:onError:db:](self, "_handle_SQLITE_ABORT_ROLLBACK:onError:db:", v10, v11, v12);
                break;
              case 517:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_BUSY_SNAPSHOT:onError:db:](self, "_handle_SQLITE_BUSY_SNAPSHOT:onError:db:", v10, v11, v12);
                break;
              case 520:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_READONLY_CANTLOCK:onError:db:](self, "_handle_SQLITE_READONLY_CANTLOCK:onError:db:", v10, v11, v12);
                break;
              case 522:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR_SHORT_READ:onError:db:](self, "_handle_SQLITE_IOERR_SHORT_READ:onError:db:", v10, v11, v12);
                break;
              case 526:
                v13 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN_ISDIR:onError:db:](self, "_handle_SQLITE_CANTOPEN_ISDIR:onError:db:", v10, v11, v12);
                break;
              default:
                goto LABEL_143;
            }
            break;
        }
        break;
    }
  }
LABEL_148:
  v14 = v13;

  return v14;
}

- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  uint64_t (**v8)(id, id);
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a3;
  v8 = (uint64_t (**)(id, id))a4;
  v9 = a5;
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v7, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("reason"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  v10 = v9;
  v11 = (void *)MEMORY[0x1A1AFDC98]();
  v12 = (v8[2](v8, v7) & 1) == 0;
  objc_autoreleasePoolPop(v11);

  return v12;
}

- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_FULL error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(1);
}

- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isInMemory") & 1) == 0)
    objc_msgSend(v10, "placeCorruptionMarker");
  v11 = -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", v8, v9, v10);

  return v11;
}

- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isInMemory") & 1) == 0)
    objc_msgSend(v10, "placeCorruptionMarker");
  v11 = -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", v8, v9, v10);

  return v11;
}

- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isInMemory") & 1) == 0)
    objc_msgSend(v10, "placeCorruptionMarker");
  v11 = -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", v8, v9, v10);

  return v11;
}

- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*__error() == 28)
    -[_PASSqliteDefaultErrorHandler _handle_SQLITE_FULL:onError:db:](self, "_handle_SQLITE_FULL:onError:db:", v8, v9, v10);
  v11 = -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", v8, v9, v10);

  return v11;
}

- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN:onError:db:](self, "_handle_SQLITE_CANTOPEN:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN:onError:db:](self, "_handle_SQLITE_CANTOPEN:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN:onError:db:](self, "_handle_SQLITE_CANTOPEN:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_CANTOPEN:onError:db:](self, "_handle_SQLITE_CANTOPEN:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_IOERR error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4 db:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("sql"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsString:", CFSTR("PRAGMA journal_mode"));

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_IOERR_SHMSIZE error: %@", (uint8_t *)&v16, 0xCu);
    }
    _exit(1);
  }
  v14 = -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", v8, v9, v10);

  return v14;
}

- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _handle_SQLITE_IOERR:onError:db:](self, "_handle_SQLITE_IOERR:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_BUSY error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(3);
}

- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_CORRUPT_VTAB error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4 db:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Exiting due to SQLITE_CONSTRAINT_VTAB error: %@", (uint8_t *)&v10, 0xCu);
  }
  _exit(2);
}

- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4 db:(id)a5
{
  return -[_PASSqliteDefaultErrorHandler _abortDueToSqliteError:onError:db:](self, "_abortDueToSqliteError:onError:db:", a3, a4, a5);
}

@end
