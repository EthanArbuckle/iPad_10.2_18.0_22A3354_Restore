@implementation ShowEventDetailsTest

- (id)createTestEvent:(id)a3 numAttendees:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  ShowEventDetailsTest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  id v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "eventStore"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[EKEvent eventWithEventStore:](EKEvent, "eventWithEventStore:", v8));
  v25 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "defaultCalendarForNewEvents"));
  objc_msgSend(v9, "setCalendar:", v10);

  objc_msgSend(v9, "setTitle:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "setStartDate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
  v26 = v9;
  objc_msgSend(v9, "setEndDate:", v12);

  if (a4 >= 1)
  {
    v13 = 0;
    do
    {
      v14 = v13 + 1;
      v15 = a4;
      v16 = self;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ShowEventDetailsTest _romanNumeralFromInt:](self, "_romanNumeralFromInt:", v13 + 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reinbach %@"), v17));

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), CFSTR("Schloteheim"), v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("test_email_address_%d@dev.null.notreal"), v13));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("555-555-5%d"), v13 + 100));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[EKAttendee participantWithName:emailAddress:phoneNumber:url:](EKAttendee, "participantWithName:emailAddress:phoneNumber:url:", v19, v20, v21, 0));
      objc_msgSend(v22, "setFirstName:", CFSTR("Schloteheim"));
      objc_msgSend(v22, "setLastName:", v18);
      objc_msgSend(v26, "addAttendee:", v22);

      self = v16;
      a4 = v15;

      v13 = v14;
    }
    while (v15 != v14);
  }
  v27 = 0;
  objc_msgSend(v25, "saveEvent:span:error:", v26, 0, &v27);
  v23 = v27;
  objc_storeStrong((id *)&self->_event, v26);

  return v26;
}

- (id)_romanNumeralFromInt:(int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  signed int v11;
  void *v12;
  void *v13;
  void *v14;

  if ((a3 - 1000) > 0xFFFFFC18)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("I"), CFSTR("II"), CFSTR("III"), CFSTR("IV"), CFSTR("V"), CFSTR("VI"), CFSTR("VII"), CFSTR("VIII"), CFSTR("IX"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("X"), CFSTR("XX"), CFSTR("XXX"), CFSTR("XL"), CFSTR("L"), CFSTR("LX"), CFSTR("LXX"), CFSTR("LXXX"), CFSTR("XC"), 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("C"), CFSTR("CC"), CFSTR("CCC"), CFSTR("CD"), CFSTR("D"), CFSTR("DC"), CFSTR("DCC"), CFSTR("DCCC"), CFSTR("CM"), 0));
    v8 = 10 * ((unsigned __int16)a3 / 0xAu);
    v9 = (unsigned __int16)a3 - v8;
    v10 = v8 % 0x64;
    v11 = a3 + 100 * (v8 / 0x64) - (unsigned __int16)a3;
    v4 = objc_alloc_init((Class)NSMutableString);
    if (v11 >= 100)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", (unsigned __int16)v11 / 0x64u - 1));
      objc_msgSend(v4, "appendString:", v12);

    }
    if (v10 >= 0xA)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", (((429496730 * (unint64_t)v10) >> 32) - 1)));
      objc_msgSend(v4, "appendString:", v13);

    }
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v9 - 1));
      objc_msgSend(v4, "appendString:", v14);

    }
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), *(_QWORD *)&a3));
  }
  return v4;
}

- (void)cleanUp
{
  void *v3;
  id v4;

  if (self->_event)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ApplicationTest model](self, "model"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventStore"));
    objc_msgSend(v3, "removeEvent:span:error:", self->_event, 0, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
