@implementation SSWorldClockResultFormattedData

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
  objc_storeStrong((id *)&self->_countryName, a3);
}

- (NSString)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSString)timeZoneDescription
{
  return self->_timeZoneDescription;
}

- (void)setTimeZoneDescription:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneDescription, a3);
}

- (NSString)timeZoneAbbreviation
{
  return self->_timeZoneAbbreviation;
}

- (void)setTimeZoneAbbreviation:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneAbbreviation, a3);
}

- (NSString)timeZoneOffsetDescription
{
  return self->_timeZoneOffsetDescription;
}

- (void)setTimeZoneOffsetDescription:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneOffsetDescription, a3);
}

- (NSString)timeAndTimeZoneOffsetDescription
{
  return self->_timeAndTimeZoneOffsetDescription;
}

- (void)setTimeAndTimeZoneOffsetDescription:(id)a3
{
  objc_storeStrong((id *)&self->_timeAndTimeZoneOffsetDescription, a3);
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

- (void)setTimeZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneName, a3);
}

- (SFCommand)punchoutCommand
{
  return self->_punchoutCommand;
}

- (void)setPunchoutCommand:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutCommand, a3);
}

- (BOOL)shouldEmphasizeTimeZone
{
  return self->_shouldEmphasizeTimeZone;
}

- (void)setShouldEmphasizeTimeZone:(BOOL)a3
{
  self->_shouldEmphasizeTimeZone = a3;
}

- (SFClockImage)clockImage
{
  return self->_clockImage;
}

- (void)setClockImage:(id)a3
{
  objc_storeStrong((id *)&self->_clockImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockImage, 0);
  objc_storeStrong((id *)&self->_punchoutCommand, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_timeAndTimeZoneOffsetDescription, 0);
  objc_storeStrong((id *)&self->_timeZoneOffsetDescription, 0);
  objc_storeStrong((id *)&self->_timeZoneAbbreviation, 0);
  objc_storeStrong((id *)&self->_timeZoneDescription, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
