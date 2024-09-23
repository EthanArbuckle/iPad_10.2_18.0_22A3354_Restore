@implementation PHRecentsPhoneHeaderView

- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8
{
  uint64_t v8;
  uint64_t v10;
  id v14;
  id v15;
  PHRecentsPhoneHeaderSummaryView *v16;
  void *v17;
  void *v18;

  v8 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = a4;
  if ((kCHCallTypeTelephony & v8) != 0)
  {
    v16 = -[PHRecentsPhoneHeaderSummaryView initWithFrame:recentCall:occurrenceDate:status:duration:type:]([PHRecentsPhoneHeaderSummaryView alloc], "initWithFrame:recentCall:occurrenceDate:status:duration:type:", v14, v15, v10, v8, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a6);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PHRecentsPersonPhoneHeaderView only handles telephony calls")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v17);

    if (_TUAssertShouldCrashApplication())
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHRecentsPhoneHeaderView.m"), 43, CFSTR("PHRecentsPersonPhoneHeaderView only handles telephony calls"));

    }
    v16 = 0;
  }

  return v16;
}

@end
