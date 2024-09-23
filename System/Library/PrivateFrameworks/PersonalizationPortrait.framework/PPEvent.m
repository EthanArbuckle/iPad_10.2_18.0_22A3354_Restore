@implementation PPEvent

- (PPEvent)initWithEKEvent:(id)a3 calendarInternPool:(id)a4
{
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  PPEvent *v9;

  v6 = a4;
  +[PPEvent deferredAllocationEventFromEKEvent:](PPEvent, "deferredAllocationEventFromEKEvent:", a3);
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  ((void (**)(_QWORD, void *, id))v7)[2](v7, v8, v6);
  v9 = (PPEvent *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURI:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 url:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20
{
  id v23;
  id v24;
  id v25;
  void *v26;
  PPEvent *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v38;
  id v40;
  id v41;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v48;

  v46 = a19;
  v44 = a18;
  v41 = a17;
  v23 = a16;
  v36 = a15;
  v32 = a13;
  v35 = a12;
  v33 = a9;
  v34 = a8;
  v48 = a7;
  v24 = a6;
  v38 = a5;
  v40 = a4;
  v25 = a3;
  objc_msgSend(a11, "absoluteString");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v31) = a20;
  LOBYTE(v30) = a14;
  LOBYTE(v29) = a10;
  v26 = v24;
  v27 = -[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](self, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v25, v40, v38, v24, v48, v34, v33, v29, v43, v35, v32, v30, v36, v45, v41,
          v44,
          v46,
          v31);

  return v27;
}

- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURIString:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 urlString:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20
{
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  PPEvent *v62;
  uint64_t i;
  uint64_t j;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88[128];
  _QWORD v89[130];

  v89[128] = *MEMORY[0x1E0C80C00];
  v87 = a3;
  v25 = a4;
  v85 = a5;
  v71 = a6;
  v84 = a6;
  v26 = a7;
  v72 = a8;
  v83 = a8;
  v82 = a9;
  v76 = a11;
  v75 = a12;
  v74 = a13;
  v73 = a15;
  v81 = a16;
  v80 = a17;
  v79 = a18;
  v78 = a19;
  v86 = v25;
  if (v25)
  {
    if (v26)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEvent.m"), 556, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectID"));

    if (v26)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEvent.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("calendar"));

LABEL_3:
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEvent.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

  }
  if (!v82)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEvent.m"), 559, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

  }
  bzero(v89, 0x400uLL);
  bzero(v88, 0x400uLL);
  if (v87)
  {
    v89[0] = CFSTR("eid");
    v88[0] = v87;
    v27 = 1;
  }
  else
  {
    v27 = 0;
  }
  v89[v27] = CFSTR("oid");
  objc_msgSend(v86, "dictionaryRepresentation");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v88[v27];
  v88[v27] = (id)v28;

  v30 = v27 + 1;
  if (v85)
  {
    v31 = (void *)v89[v30];
    v89[v30] = CFSTR("ttl");

    objc_storeStrong(&v88[v30], a5);
    v30 = v27 | 2;
  }
  if (v84)
  {
    v32 = (void *)v89[v30];
    v89[v30] = CFSTR("loc");

    objc_storeStrong(&v88[v30++], v71);
  }
  v33 = v30;
  v34 = (void *)v89[v30];
  v89[v30] = CFSTR("sdt");

  objc_storeStrong(&v88[v30], v72);
  v35 = (void *)v89[v30 + 1];
  v89[v33 + 1] = CFSTR("edt");

  objc_storeStrong(&v88[v30 + 1], a9);
  v36 = 8 * v30 + 16;
  v37 = *(void **)((char *)v89 + v36);
  v89[v33 + 2] = CFSTR("avl");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", a10);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = *(id *)((char *)v88 + v36);
  *(id *)((char *)v88 + v36) = (id)v38;

  v40 = v30 + 3;
  if (v76)
  {
    v41 = (void *)v89[v40];
    v89[v40] = CFSTR("uri");

    objc_storeStrong(&v88[v40], a11);
    v40 = v30 + 4;
  }
  if (v75)
  {
    v42 = (void *)v89[v40];
    v89[v40] = CFSTR("atn");

    objc_msgSend(v75, "_pas_mappedArrayWithTransform:", &__block_literal_global_130);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v88[v40];
    v88[v40] = (id)v43;

    ++v40;
  }
  if (v74)
  {
    v45 = (void *)v89[v40];
    v89[v40] = CFSTR("onm");

    objc_storeStrong(&v88[v40++], a13);
  }
  v46 = (void *)v89[v40];
  v89[v40] = CFSTR("efl");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a14);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v88[v40];
  v88[v40] = (id)v47;

  v49 = v40 + 1;
  if (v73)
  {
    v50 = (void *)v89[v49];
    v89[v49] = CFSTR("not");

    objc_storeStrong(&v88[v49], a15);
    v49 = v40 + 2;
  }
  v51 = v78;
  if (v81)
  {
    v52 = (void *)v89[v49];
    v89[v49] = CFSTR("url");

    objc_storeStrong(&v88[v49++], a16);
  }
  if (v80)
  {
    v53 = (void *)v89[v49];
    v89[v49] = CFSTR("slt");

    objc_storeStrong(&v88[v49++], a17);
  }
  if (v79)
  {
    v54 = (void *)v89[v49];
    v89[v49] = CFSTR("sla");

    objc_storeStrong(&v88[v49++], a18);
  }
  if (v78)
  {
    v55 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v78, 1, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v55);
    if (v56)
    {
      v57 = (void *)v89[v49];
      v89[v49] = CFSTR("slc");

      objc_storeStrong(&v88[v49++], v56);
    }

    v51 = v78;
  }
  if (a20)
  {
    v58 = (void *)v89[v49];
    v89[v49] = CFSTR("sec");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a20);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v88[v49];
    v88[v49] = (id)v59;

    ++v49;
  }
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v88, v89, v49);
  v62 = -[PPEvent initWithPlist:calendar:](self, "initWithPlist:calendar:", v61, v26);

  for (i = 127; i != -1; --i)
  for (j = 127; j != -1; --j)

  return v62;
}

- (PPEvent)initWithPlist:(id)a3 calendar:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PPEvent *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PPEvent initWithIndex:inBackingPlists:calendar:](self, "initWithIndex:inBackingPlists:calendar:", 0, v9, v7, v12, v13);
  return v10;
}

- (PPEvent)initWithIndex:(unint64_t)a3 inBackingPlists:(id)a4 calendar:(id)a5
{
  id v9;
  id v10;
  PPEvent *v11;
  PPEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PPEvent;
  v11 = -[PPEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_indexInBackingPlists = a3;
    objc_storeStrong((id *)&v11->_backingPlists, a4);
    objc_storeStrong((id *)&v12->_calendar, a5);
  }

  return v12;
}

- (NSString)eventIdentifier
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (EKObjectID)objectID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)getEKObjectIDClass());
  -[PPAttendee _plist]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("oid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDictionaryRepresentation:", v5);

  return (EKObjectID *)v6;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ttl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)location
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("loc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sdt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("edt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (char)availability
{
  void *v2;
  void *v3;
  char v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("avl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedCharValue");

  return v4;
}

- (NSURL)externalURI
{
  void *v2;
  void *v3;
  void *v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("uri"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (NSArray)attendees
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("atn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99D20];
    v8[4] = v4;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __20__PPEvent_attendees__block_invoke;
    v9[3] = &unk_1E226A1F0;
    v10 = v3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __20__PPEvent_attendees__block_invoke_2;
    v8[3] = &__block_descriptor_40_e5_Q8__0l;
    v6 = v3;
    objc_msgSend(v5, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v9, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v3;
}

- (NSString)organizerName
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("onm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)eventFlags
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("efl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedCharValue");

  return v4;
}

- (NSString)notes
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("not"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)url
{
  void *v2;
  void *v3;
  void *v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (NSString)structuredLocationTitle
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("slt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)structuredLocationAddress
{
  void *v2;
  void *v3;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sla"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CLLocation)structuredLocationCoordinates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("slc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x18D7805AC]();
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x18D7805AC]();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v8 = 0;
  }

  return (CLLocation *)v8;
}

- (unsigned)suggestedEventCategory
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[PPAttendee _plist]((uint64_t)self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedCharValue");

  return v4;
}

- (BOOL)representsUnscheduledFreeTime
{
  return (-[PPEvent eventFlags](self, "eventFlags") >> 1) & 1;
}

- (BOOL)organizerIsCurrentUser
{
  return -[PPEvent eventFlags](self, "eventFlags") & 1;
}

- (int64_t)compareStartDateWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[PPEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPEvent eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEvent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEvent startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEvent endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEvent attendees](self, "attendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPEvent i:'%@' t:'%@' s:'%@' e:'%@' a:'%tu'>"), v4, v5, v6, v7, objc_msgSend(v8, "count"));

  return v9;
}

- (PPEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id EKObjectIDClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPEvent *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PPEvent *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("eid"));
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("oid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    EKObjectIDClass = getEKObjectIDClass();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v8);
    objc_msgSend(EKObjectIDClass, "objectIDWithURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("ttl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("sdt"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("edt"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (v11 && v13 && v14 && v15)
  {
    v40 = v15;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("loc"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("avl"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("uri"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x18D7805AC]();
    v41 = v12;
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v42 = v11;
    v19 = objc_opt_class();
    v35 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("atn"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("onm"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("efl"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("not"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("url"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("slt"));
    v38 = v14;
    v21 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("sla"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("slc"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sec"));
    LOBYTE(v29) = v33;
    LOBYTE(v28) = v36;
    v25 = (void *)v43;
    v26 = objc_retain(-[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](self, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v43, v42, v41, v37, v21, v38, v40, v28, v39, v32, v34, v29, v31, v20,
              v22,
              v23,
              v24,
              v30));

    v13 = v21;
    v14 = v38;

    v12 = v41;
    v16 = v26;
    v11 = v42;

    v15 = v40;
    self = v16;
  }
  else
  {
    v25 = (void *)v43;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  -[PPEvent eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("eid"));

  -[PPEvent objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URIRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("oid"));

  -[PPEvent title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("ttl"));

  -[PPEvent location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v9, CFSTR("loc"));

  -[PPEvent calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("cal"));

  -[PPEvent startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v11, CFSTR("sdt"));

  -[PPEvent endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("edt"));

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent availability](self, "availability"), CFSTR("avl"));
  -[PPEvent externalURI](self, "externalURI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v13, CFSTR("uri"));

  -[PPEvent attendees](self, "attendees");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("atn"));

  -[PPEvent organizerName](self, "organizerName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v15, CFSTR("onm"));

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent eventFlags](self, "eventFlags"), CFSTR("efl"));
  -[PPEvent notes](self, "notes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("not"));

  -[PPEvent url](self, "url");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("url"));

  -[PPEvent structuredLocationTitle](self, "structuredLocationTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("slt"));

  -[PPEvent structuredLocationAddress](self, "structuredLocationAddress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("sla"));

  -[PPEvent structuredLocationCoordinates](self, "structuredLocationCoordinates");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("slc"));

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent suggestedEventCategory](self, "suggestedEventCategory"), CFSTR("sec"));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PPEvent objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PPEvent *v4;
  PPEvent *v5;
  id *v6;
  id *v7;
  PPCalendar *calendar;
  PPCalendar *v9;
  PPCalendar *v10;
  PPCalendar *v11;
  BOOL v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v32;
  id *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (PPEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self)
        {
          calendar = self->_calendar;
          v9 = (PPCalendar *)v6[3];
          if (calendar == v9)
          {

          }
          else
          {
            v10 = v9;
            v11 = calendar;
            v12 = -[PPCalendar isEqual:](v11, "isEqual:", v10);

            if (!v12)
              goto LABEL_7;
          }
          -[NSArray objectAtIndexedSubscript:](self->_backingPlists, "objectAtIndexedSubscript:", self->_indexInBackingPlists);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7[1], "objectAtIndexedSubscript:", v7[2]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "count");
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("slc"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v16 - (v17 != 0);
          v19 = objc_msgSend(v15, "count");
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("slc"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v19 - (v20 != 0);

          if (v18 == v21)
          {
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v22 = v14;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v23)
            {
              v24 = v23;
              v32 = v14;
              v33 = v7;
              v25 = *(_QWORD *)v35;
              while (2)
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v35 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                  if ((objc_msgSend(v27, "isEqual:", CFSTR("slc"), v32, v33, (_QWORD)v34) & 1) == 0)
                  {
                    objc_msgSend(v22, "objectForKeyedSubscript:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "objectForKeyedSubscript:", v27);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v28, "isEqual:", v29);

                    if (!v30)
                    {
                      v13 = 0;
                      goto LABEL_24;
                    }
                  }
                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
                if (v24)
                  continue;
                break;
              }
              v13 = 1;
LABEL_24:
              v14 = v32;
              v7 = v33;
            }
            else
            {
              v13 = 1;
            }

          }
          else
          {
            v13 = 0;
          }

          goto LABEL_28;
        }
LABEL_7:
        v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v13 = 0;
  }
LABEL_29:

  return v13;
}

- (BOOL)isStructuredEvent
{
  int v3;

  v3 = -[PPEvent suggestedEventCategory](self, "suggestedEventCategory");
  if (v3)
    LOBYTE(v3) = -[PPEvent suggestedEventCategory](self, "suggestedEventCategory") != 12;
  return v3;
}

- (BOOL)isNLEvent
{
  return -[PPEvent suggestedEventCategory](self, "suggestedEventCategory") == 12;
}

- (PPCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_backingPlists, 0);
}

id *__20__PPEvent_attendees__block_invoke(uint64_t a1, void *a2)
{
  return -[PPAttendee initWithIndex:inBackingPlists:]((id *)[PPAttendee alloc], a2, *(void **)(a1 + 32));
}

uint64_t __20__PPEvent_attendees__block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

id __271__PPEvent_initWithEventIdentifier_objectID_title_location_calendar_startDate_endDate_availability_externalURIString_attendees_organizerName_eventFlags_notes_urlString_structuredLocationTitle_structuredLocationAddress_structuredLocationCoordinates_suggestedEventCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[PPAttendee _plist](a2);
}

+ (id)deferredAllocationEventFromEKEvent:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  char v81;
  char v82;
  _QWORD v83[2];
  _QWORD v84[2];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v3, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v3, "endDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v3, "eventIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "organizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCurrentUser");

    v10 = objc_msgSend(v3, "eligibleForTravelAdvisories");
    v11 = v9 | 4;
    if (!v10)
      v11 = v9;
    v59 = v11;
    objc_msgSend(v3, "preferredLocationWithoutPrediction");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendar");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v57 = objc_msgSend((id)objc_opt_class(), "suggestedEventCategoryFromMetadata:", v14);
    else
      v57 = 0;
    objc_msgSend(v3, "locationWithoutPrediction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      v54 = v17;
    }
    else
    {

      v54 = 0;
    }
    objc_msgSend(v3, "attendees");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_110);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "hasNotes"))
    {
      objc_msgSend(v3, "notes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
    }
    -[NSObject title](v12, "title");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v3, "availability");
    objc_msgSend(v3, "externalURI");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v63 = v12;
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "organizer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "absoluteString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject address](v63, "address");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject geoLocation](v63, "geoLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_4;
    v64[3] = &unk_1E226A140;
    v65 = v62;
    v66 = v19;
    v67 = v61;
    v68 = v43;
    v69 = v42;
    v70 = v54;
    v71 = v44;
    v72 = v20;
    v73 = v47;
    v74 = v23;
    v81 = v59;
    v75 = v50;
    v76 = v25;
    v77 = v55;
    v78 = v26;
    v79 = v27;
    v80 = v52;
    v82 = v57;
    v60 = v27;
    v58 = v26;
    v56 = v55;
    v53 = v25;
    v51 = v50;
    v49 = v23;
    v48 = v47;
    v46 = v20;
    v45 = v44;
    v28 = v54;
    v29 = v42;
    v30 = v43;
    v31 = v61;
    v32 = v19;
    v33 = v62;
    v16 = (void *)objc_msgSend(v64, "copy");

    v15 = v63;
  }
  else
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v83[0] = CFSTR("nil start date");
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "startDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithInt:", v36 == 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v83[1] = CFSTR("nil end date");
      v84[0] = v37;
      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "endDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithInt:", v39 == 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v86 = v41;
      _os_log_debug_impl(&dword_18BE3A000, v15, OS_LOG_TYPE_DEBUG, "PPEvent initWithEKEvent returning nil due to: %@", buf, 0xCu);

    }
    v16 = &__block_literal_global_1367;
  }

  objc_autoreleasePoolPop(v4);
  return v16;
}

+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x1E0C99E20];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = objc_msgSend(v8, "count");
  if ((unint64_t)(10 * v10) >= 0x4000)
    v11 = 0x4000;
  else
    v11 = 10 * v10;
  v12 = (void *)objc_msgSend(v9, "initWithCapacity:", v11);
  objc_msgSend(a1, "convertBatchOfEKEvents:calendarInternPool:interningSet:", v8, v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4 interningSet:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v30 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents begin (count %tu)", buf, 0xCu);
    }

    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents step 1 begin: generate deferredAllocationBlocks", buf, 2u);
    }

    v13 = (void *)MEMORY[0x18D7805AC]();
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke;
    v28[3] = &__block_descriptor_40_e17__16__0__EKEvent_8l;
    v28[4] = a1;
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents step 2 begin: run deferredAllocationBlocks", buf, 2u);
    }

    v17 = (void *)MEMORY[0x18D7805AC]();
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke_119;
    v25[3] = &unk_1E226A188;
    v18 = v10;
    v26 = v18;
    v27 = v9;
    objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v17);
    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v8, "count");
      v22 = objc_msgSend(v19, "count");
      v23 = objc_msgSend(v18, "count");
      *(_DWORD *)buf = 134218496;
      v30 = v21;
      v31 = 2048;
      v32 = v22;
      v33 = 2048;
      v34 = v23;
      _os_log_impl(&dword_18BE3A000, v20, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents complete (ekEvent count %tu, ppEvent count %tu, interningSet count %tu)", buf, 0x20u);
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)suggestedEventCategoryFromMetadata:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGEventMetadataTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("StructuredEvent"));

  if (v5)
  {
    v6 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(&unk_1E2285570, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v11 = objc_msgSend(v9, "unsignedCharValue");
      }
      else
      {
        pp_default_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          v16 = 138543362;
          v17 = v8;
          _os_log_fault_impl(&dword_18BE3A000, v14, OS_LOG_TYPE_FAULT, "PPEvent creation with unknown suggested category: StructuredEvent::%{public}@", (uint8_t *)&v16, 0xCu);
        }

        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

    objc_autoreleasePoolPop(v6);
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGEventMetadataTypeKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("NLEvent"));

    if (v13)
      v11 = 12;
    else
      v11 = 0;
  }

  return v11;
}

+ (id)descriptionForSuggestedEventCategory:(unsigned __int8)a3
{
  if (a3 > 0xCu)
    return 0;
  else
    return off_1E226A248[a3];
}

uint64_t __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deferredAllocationEventFromEKEvent:", a2);
}

uint64_t __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke_119(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

PPEvent *__46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PPEvent *v27;
  PPEvent *v28;
  void *v29;
  void *v30;
  PPCalendar *v31;
  _QWORD v32[4];
  id v33;

  v5 = a2;
  v6 = a3;
  v31 = -[PPCalendar initWithEKCalendar:internPool:]([PPCalendar alloc], "initWithEKCalendar:internPool:", *(_QWORD *)(a1 + 32), v6);

  v7 = *(void **)(a1 + 40);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_5;
  v32[3] = &unk_1E226A118;
  v33 = v5;
  v8 = v5;
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = [PPEvent alloc];
  internUsingSet(*(void **)(a1 + 48), v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 56), v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 64), v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 72), v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 80), v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 88), v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 152);
  internUsingSet(*(void **)(a1 + 96), v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 104), v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_BYTE *)(a1 + 160);
  internUsingSet(*(void **)(a1 + 112), v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 120), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 128), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 136), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  internUsingSet(*(void **)(a1 + 144), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = *(_BYTE *)(a1 + 161);
  LOBYTE(v15) = v21;
  LOBYTE(v14) = v22;
  v28 = -[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](v27, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v24, v29, v26, v25, v31, v23, v20, v14, v19, v30, v18, v15, v17, v9, v10,
          v11,
          v12,
          v16);

  return v28;
}

uint64_t __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke()
{
  return 0;
}

uint64_t __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

id __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v2, "isCurrentUser");
  v7 = objc_msgSend(v2, "participantStatus");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_3;
  v13[3] = &unk_1E226A0F0;
  v14 = v3;
  v15 = v4;
  v18 = (char)v5;
  v16 = v6;
  v17 = v7;
  v8 = v6;
  v9 = v4;
  v10 = v3;
  v11 = (void *)objc_msgSend(v13, "copy");

  return v11;
}

id __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  PPAttendee *v4;
  void *v5;

  v3 = a2;
  v4 = -[PPAttendee initWithName:emailAddress:urlString:isCurrentUser:status:]([PPAttendee alloc], "initWithName:emailAddress:urlString:isCurrentUser:status:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 56));
  internUsingSet(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
