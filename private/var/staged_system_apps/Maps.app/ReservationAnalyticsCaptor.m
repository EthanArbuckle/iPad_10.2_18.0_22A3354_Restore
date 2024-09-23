@implementation ReservationAnalyticsCaptor

- (id)_createActionDetails
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAnalyticsCaptor mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_geoMapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlaceActionDetails actionDetailsWithMapItem:timestamp:resultIndex:](GEOPlaceActionDetails, "actionDetailsWithMapItem:timestamp:resultIndex:", v3, 0xFFFFFFFFLL, 0.0));

  return v4;
}

- (void)_captureAction:(int)a3 target:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAnalyticsCaptor _createActionDetails](self, "_createActionDetails"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:placeActionDetails:", v5, v4, 0, v7);

}

- (void)captureSelectTimeViewMoreOptions
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12001, 633);
}

- (void)captureSelectTimeSelected
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12002, 633);
}

- (void)captureSelectTimeEditBooking
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12006, 633);
}

- (void)captureSelectTimeEditUserInfo
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 6034, 633);
}

- (void)captureSelectTimeAddSpecialRequest
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12008, 633);
}

- (void)captureSelectTimeLearnMore
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12010, 633);
}

- (void)captureSelectTimePunchOut
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 6020, 633);
}

- (void)captureSelectTimeReserveTable
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 6036, 633);
}

- (void)captureSelectTimeCancel
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 4, 633);
}

- (void)captureMoreOptionsSelectDateTime
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 3031, 634);
}

- (void)captureMoreOptionsIncreaseTableSize
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12005, 634);
}

- (void)captureMoreOptionsDecreaseTableSize
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12004, 634);
}

- (void)captureMoreOptionsSubmit
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 17, 634);
}

- (void)captureMoreOptionsCancel
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 4, 634);
}

- (void)captureBookedChangeReservation
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 12009, 636);
}

- (void)captureBookedCancel
{
  -[ReservationAnalyticsCaptor _captureAction:target:](self, "_captureAction:target:", 4, 636);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
