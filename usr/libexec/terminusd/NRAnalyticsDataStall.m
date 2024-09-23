@implementation NRAnalyticsDataStall

- (void)submit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self)
  {
    if (self->_stalledNexusVOOutput)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v3, CFSTR("stalledNexusVOOutput"));

    }
    if (self->_stalledNexusVIOutput)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v4, CFSTR("stalledNexusVIOutput"));

    }
    if (self->_stalledNexusOutput)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v5, CFSTR("stalledNexusOutput"));

    }
    if (self->_stalledNexusBKOutput)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v6, CFSTR("stalledNexusBKOutput"));

    }
    if (self->_stalledLinkOutput)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v7, CFSTR("stalledLinkOutput"));

    }
    if (self->_stalledUrgentLinkOutput)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v8, CFSTR("stalledUrgentLinkOutput"));

    }
    if (self->_stalledDatagramLinkOutput)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v9, CFSTR("stalledDatagramLinkOutput"));

    }
    if (self->_remediatedDataStall)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._eventDictionary, "setObject:forKeyedSubscript:", v10, CFSTR("remediatedDataStall"));

    }
  }
  sub_100120038((uint64_t)self, CFSTR("com.apple.networkrelay.analytics.dataStall"));
}

@end
