@implementation TSTimeErrorSequence

+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5
{
  id v8;
  TSTimeErrorValue *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  TSTimeErrorValue *v13;
  void *v14;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && a4 && a5 >= 1)
  {
    do
    {
      v9 = [TSTimeErrorValue alloc];
      v11 = *a3++;
      v10 = v11;
      v12 = *a4++;
      v13 = -[TSTimeErrorValue initWithTimestamp:andError:](v9, "initWithTimestamp:andError:", v10, v12);
      objc_msgSend(v8, "addObject:", v13);

      --a5;
    }
    while (a5);
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTimeErrors:", v8);

  return v14;
}

- (TSTimeErrorSequence)initWithTimeErrors:(id)a3
{
  id v4;
  TSTimeErrorSequence *v5;
  uint64_t v6;
  NSArray *timeErrors;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSTimeErrorSequence;
  v5 = -[TSTimeErrorSequence init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v4);
    timeErrors = v5->_timeErrors;
    v5->_timeErrors = (NSArray *)v6;

  }
  return v5;
}

- (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v7 = a7;
  v11 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB37A0];
  v14 = a5;
  v15 = a4;
  objc_msgSend(v13, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("#!/usr/bin/env python3\n\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport os\nimport sys\n"));
  if (v11)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@/%@'"), v11, v15);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("os.path.split(sys.argv[0])[0]+'/%@'"), v15, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "appendFormat:", CFSTR("timeErrorRecords = np.recfromtxt(%@, dtype=None, delimiter=',', names=True, encoding='utf-8')\n\ntime = timeErrorRecords.time\ntimeError = timeErrorRecords.time_error\n\n"), v17);
  objc_msgSend(v16, "appendFormat:", CFSTR("f1, ax1 = plt.subplots()\nax1.plot(time, timeError, 'r-')\nax1.set_ylabel('Time Error (ns)')\nax1.set_xlabel('Time (ns)')\nax1.set_title('Time Errors - %@')\nax1.grid(True)\n\nplt.subplots_adjust(left=0.05, right=0.97, bottom=0.05, top=0.97)\n"), v14);

  if (v12)
    objc_msgSend(v16, "appendFormat:", CFSTR("\nf1.set_size_inches(32, 16.98753)\n\nf1.savefig('%@')\n"), v12);
  if (v7)
    objc_msgSend(v16, "appendString:", CFSTR("\nplt.show()\n"));

  return v16;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return -[TSTimeErrorSequence exportTimeErrorsToDirectoryURL:withFilename:](self, "exportTimeErrorsToDirectoryURL:withFilename:", a3, CFSTR("time_errors.csv"));
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  FILE *v11;
  BOOL v12;
  FILE *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = fopen((const char *)objc_msgSend(v10, "UTF8String"), "w");
    v12 = v11 != 0;
    if (v11)
    {
      v13 = v11;
      v20 = v10;
      v21 = v11 != 0;
      fwrite("time,time error\n", 0x10uLL, 1uLL, v11);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[TSTimeErrorSequence timeErrors](self, "timeErrors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            fprintf(v13, "%llu,%lld\n", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "timestamp"), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "error"));
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

      fclose(v13);
      v12 = v21;
      v10 = v20;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)timeErrors
{
  return self->_timeErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeErrors, 0);
}

@end
