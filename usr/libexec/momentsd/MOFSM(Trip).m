@implementation MOFSM(Trip)

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  unint64_t v15;
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

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM name](self, "name"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mask"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceState](self, "referenceState"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mask"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceStateCode](self, "referenceStateCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mask"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountry](self, "referenceCountry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mask"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM referenceCountryCode](self, "referenceCountryCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mask"));
  v15 = -[MOFSM mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM stringFromState:](self, "stringFromState:", -[MOFSM state](self, "state")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM substate](self, "substate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mask"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM destination](self, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mask"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeStartDate](self, "timeRangeStartDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM timeRangeEndDate](self, "timeRangeEndDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOFSM lastProcessedDate](self, "lastProcessedDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: name, %@, state, %@(%@), country, %@(%@), mode, %lu, state, %@, subState, %@, destination, %@, startDate, %@, endDate, %@, timestamp, %@"), v20, v18, v26, v17, v14, v13, v15, v5, v6, v8, v9, v10, v11));

  return v21;
}

@end
