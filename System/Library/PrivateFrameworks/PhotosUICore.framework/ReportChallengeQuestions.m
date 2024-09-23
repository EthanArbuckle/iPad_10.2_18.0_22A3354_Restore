@implementation ReportChallengeQuestions

uint64_t ___ReportChallengeQuestions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoAnalysisClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v6 = objc_msgSend(v5, "reportMetricsWithOptions:error:", MEMORY[0x1E0C9AA70], &v15);
  v7 = v15;

  if ((v6 & 1) != 0)
  {
    v8 = CFSTR("Successfully sent metrics to analytics.\n\nThank you!");
  }
  else
  {
    objc_msgSend(v7, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v7, "description");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to send metrics: %@"), v13);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Failed to send metrics.");
    }

  }
  _PresentAlert((uint64_t)CFSTR("Photos Challenge Metrics"), (uint64_t)v8, v3);

  return 1;
}

@end
