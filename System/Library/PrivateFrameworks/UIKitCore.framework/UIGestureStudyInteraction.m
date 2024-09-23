@implementation UIGestureStudyInteraction

id __50___UIGestureStudyInteraction__handleMetricsEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  long double v12;
  long double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  long double v19;
  long double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("gesture_type"));

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  v27[0] = CFSTR("total_duration");
  objc_msgSend(*(id *)(a1 + 32), "duration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = 0.0;
  v11 = 0.0;
  if (v8 != 0.0)
  {
    v12 = fabs(v8);
    v13 = v8 / v12;
    v14 = log10(v12);
    v15 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v14));
    v11 = v13 * (round(v12 * v15) / v15);
  }
  objc_msgSend(v9, "numberWithDouble:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v16;
  v27[1] = CFSTR("total_movement");
  objc_msgSend(*(id *)(a1 + 32), "movement");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  if (v17 != 0.0)
  {
    v19 = fabs(v17);
    v20 = v17 / v19;
    v21 = log10(v19);
    v22 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v21));
    v10 = v20 * (round(v19 * v22) / v22);
  }
  objc_msgSend(v18, "numberWithDouble:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v23;
  v27[2] = CFSTR("total_touch_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "observedTouchCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v25);

  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

void __66___UIGestureStudyInteraction__reportEventForTriggeredParticipant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v6 = v7;
    if (!strcmp((const char *)objc_msgSend(v7, "objCType"), "d"))
    {
      objc_msgSend(v7, "doubleValue");
      v9 = (void *)MEMORY[0x1E0CB37E8];
      if (v8 == 0.0)
      {
        v14 = 0.0;
      }
      else
      {
        v10 = fabs(v8);
        v11 = v8 / v10;
        v12 = log10(v10);
        v13 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v12));
        v14 = v11 * (round(v10 * v13) / v13);
      }
      objc_msgSend(v9, "numberWithDouble:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v15);

}

@end
