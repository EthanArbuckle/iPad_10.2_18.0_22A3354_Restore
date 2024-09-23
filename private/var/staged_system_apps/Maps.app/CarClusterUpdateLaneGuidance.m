@implementation CarClusterUpdateLaneGuidance

+ (id)laneGuidanceUpdateWithComposedGuidanceEvent:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  CarClusterUpdateLaneGuidance *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lanes"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_opt_new(CarClusterUpdateLaneGuidance);
    -[CarClusterUpdate setComponent:](v9, "setComponent:", v6);
    -[CarClusterUpdateLaneGuidance setComposedGuidanceEvent:](v9, "setComposedGuidanceEvent:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lanes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarClusterUpdateLaneGuidanceLaneInfo laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:](CarClusterUpdateLaneGuidanceLaneInfo, "laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:", v10));
    -[CarClusterUpdateLaneGuidance setLaneInfoList:](v9, "setLaneInfoList:", v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)uniqueID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdateLaneGuidance composedGuidanceEvent](self, "composedGuidanceEvent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uniqueID"));

  return (NSUUID *)v3;
}

- (void)setInstructionText:(id)a3
{
  NSString *v4;
  NSString *instructionText;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  instructionText = self->_instructionText;
  self->_instructionText = v4;

}

- (id)debugProperties
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CarClusterUpdateLaneGuidance hasBeenSent](self, "hasBeenSent");
  v3 = CFSTR("NO");
  if (v2)
    v3 = CFSTR("YES");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("hasBeenSent=%@"), v3);
}

+ (id)_integersKeyed
{
  if (qword_1014D3EB0 != -1)
    dispatch_once(&qword_1014D3EB0, &stru_1011E1F10);
  return (id)qword_1014D3EB8;
}

- (BOOL)hasBeenSent
{
  return self->_hasBeenSent;
}

- (void)setHasBeenSent:(BOOL)a3
{
  self->_hasBeenSent = a3;
}

- (GEOComposedGuidanceEvent)composedGuidanceEvent
{
  return self->_composedGuidanceEvent;
}

- (void)setComposedGuidanceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_composedGuidanceEvent, a3);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIndex:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)laneInfoList
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLaneInfoList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)instructionText
{
  return self->_instructionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionText, 0);
  objc_storeStrong((id *)&self->_laneInfoList, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_composedGuidanceEvent, 0);
}

@end
