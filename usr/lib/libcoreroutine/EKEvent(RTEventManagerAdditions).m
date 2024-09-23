@implementation EKEvent(RTEventManagerAdditions)

+ (const)participationStatusToString:()RTEventManagerAdditions
{
  if (a3 > 7)
    return CFSTR("Unhandled");
  else
    return off_1E92A4F60[a3];
}

- (uint64_t)participantStatus
{
  uint64_t result;

  result = objc_msgSend(a1, "participationStatus");
  if ((unint64_t)(result - 1) >= 7)
    return 0;
  return result;
}

- (id)description
{
  const __CFString *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;
  void *v16;

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  v14 = v2;
  objc_msgSend(a1, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(a1, "structuredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(a1, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "participationStatusToString:", objc_msgSend(a1, "participationStatus"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("title, %@, location, %@, structuredLocation, %@, startDate, %@, endDate, %@, participationStatus, %@"), v14, v4, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
