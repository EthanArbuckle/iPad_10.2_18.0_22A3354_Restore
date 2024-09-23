@implementation FMCompareLocatorPublisher

- (FMCompareLocatorPublisher)initWithPrimaryPublisher:(id)a3 compareToPublishers:(id)a4
{
  id v6;
  id v7;
  FMCompareLocatorPublisher *v8;
  FMCompareLocatorPublisher *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMCompareLocatorPublisher;
  v8 = -[FMCompareLocatorPublisher init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[FMCompareLocatorPublisher setPrimaryPublisher:](v8, "setPrimaryPublisher:", v6);
    -[FMCompareLocatorPublisher setComparisonPublishers:](v9, "setComparisonPublishers:", v7);
  }

  return v9;
}

- (void)updatedLocations:(id)a3
{
  -[FMCompareLocatorPublisher updatedLocations:reason:](self, "updatedLocations:reason:", a3, 0);
}

- (void)updatedLocations:(id)a3 reason:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v7, "updatedLocations:reason:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005F040;
  v10[3] = &unk_1002C3860;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v8, v10);

}

- (void)startPublishingWithBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id from;
  _QWORD v19[4];
  id v20;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005F244;
  v19[3] = &unk_1002C3888;
  objc_copyWeak(&v20, &location);
  v5 = objc_retainBlock(v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_initWeak(&from, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005F2B0;
  v14[3] = &unk_1002C38B0;
  v8 = v4;
  v15 = v8;
  objc_copyWeak(&v17, &from);
  v9 = v5;
  v16 = v9;
  objc_msgSend(v7, "startPublishingWithBlock:", v14);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005F394;
  v12[3] = &unk_1002C3900;
  v11 = v9;
  v13 = v11;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v10, v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)setStartThreshold:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_startThreshold, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setStartThreshold:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F4F4;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)setEndThreshold:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_endThreshold, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setEndThreshold:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F5C8;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)setDecayFactor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_decayFactor, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setDecayFactor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F69C;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)setMinimumDistance:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_minimumDistance, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setMinimumDistance:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F770;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)setPublishTimeInterval:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_publishTimeInterval, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setPublishTimeInterval:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F844;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)setCachedLocationValidityTimeInterval:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v6, "setCachedLocationValidityTimeInterval:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005F918;
  v9[3] = &unk_1002C3928;
  v10 = v5;
  v8 = v5;
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v7, v9);

}

- (void)logPublishedLocation:(id)a3 reason:(int64_t)a4 publisher:(id)a5
{
  id v8;
  id v9;
  FMDEventLoggerEventLocate *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v8 = a5;
  v9 = a3;
  v10 = -[FMDEventLoggerEventLocate initWithEventName:]([FMDEventLoggerEventLocate alloc], "initWithEventName:", CFSTR("FMGeoLocatableComparison"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "latitude"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "longitude"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v11, v12));
  -[FMDEventLoggerEventLocate setObject:forKey:](v10, "setObject:forKey:", v13, CFSTR("loc"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[FMDEventLoggerEventLocate setObject:forKey:](v10, "setObject:forKey:", v14, CFSTR("reason"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_logID"));
  -[FMDEventLoggerEventLocate setObject:forKey:](v10, "setObject:forKey:", v15, CFSTR("publisher"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher fm_logID](self, "fm_logID"));
  -[FMDEventLoggerEventLocate setObject:forKey:](v10, "setObject:forKey:", v16, CFSTR("instance"));

  v17 = sub_1000031B8();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_logID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher fm_logID](self, "fm_logID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    *(_DWORD *)buf = 138413058;
    v28 = v13;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "🛣 FMCompareLocatorPublisher Loc: %@ Pub: %@ Inst: %@ Reason: %@", buf, 0x2Au);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLogger sharedLogger](FMDEventLogger, "sharedLogger"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDiskStats facilityName](FMDEventLoggerFacilityOnDiskStats, "facilityName"));
  v26[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDisk facilityName](FMDEventLoggerFacilityOnDisk, "facilityName"));
  v26[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));
  objc_msgSend(v22, "logEvent:toFacilitiesNamed:", v10, v25);

}

- (void)publishers:(id)a3 performBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v7 = objc_msgSend(a3, "copy");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005FC6C;
  v8[3] = &unk_1002C3950;
  v9 = v5;
  v6 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

- (void)flushLocations
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher primaryPublisher](self, "primaryPublisher"));
  objc_msgSend(v3, "flushLocations");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMCompareLocatorPublisher comparisonPublishers](self, "comparisonPublishers"));
  -[FMCompareLocatorPublisher publishers:performBlock:](self, "publishers:performBlock:", v4, &stru_1002C3990);

}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (NSNumber)minimumDistance
{
  return self->_minimumDistance;
}

- (NSNumber)publishTimeInterval
{
  return self->_publishTimeInterval;
}

- (NSNumber)cachedLocationValidityTimeInterval
{
  return self->_cachedLocationValidityTimeInterval;
}

- (FMLocatorPublishing)primaryPublisher
{
  return self->_primaryPublisher;
}

- (void)setPrimaryPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPublisher, a3);
}

- (NSArray)comparisonPublishers
{
  return self->_comparisonPublishers;
}

- (void)setComparisonPublishers:(id)a3
{
  objc_storeStrong((id *)&self->_comparisonPublishers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparisonPublishers, 0);
  objc_storeStrong((id *)&self->_primaryPublisher, 0);
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, 0);
  objc_storeStrong((id *)&self->_publishTimeInterval, 0);
  objc_storeStrong((id *)&self->_minimumDistance, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);
  objc_storeStrong((id *)&self->_startThreshold, 0);
}

@end
