@implementation TransitSegmentSteppingModeSign

- (TransitSegmentSteppingModeSign)initWithStep:(id)a3 stepIndexRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  TransitSegmentSteppingModeSign *v9;
  TransitSegmentSteppingModeSign *v10;
  uint64_t v11;
  MNTransitInstruction *instruction;
  MergedTransitRoutingIncidentMessage *v13;
  void *v14;
  MergedTransitRoutingIncidentMessage *v15;
  MergedTransitRoutingIncidentMessage *incidentMessage;
  TransitSegmentSteppingModeSign *v17;
  objc_super v19;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TransitSegmentSteppingModeSign;
  v9 = -[TransitSegmentSteppingModeSign init](&v19, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_step, a3);
    v10->_stepIndexRange.location = location;
    v10->_stepIndexRange.length = length;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitInstructionInContext:", 1));
    instruction = v10->_instruction;
    v10->_instruction = (MNTransitInstruction *)v11;

    v13 = [MergedTransitRoutingIncidentMessage alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitIncidents"));
    v15 = -[MergedTransitRoutingIncidentMessage initWithTransitIncidents:](v13, "initWithTransitIncidents:", v14);
    incidentMessage = v10->_incidentMessage;
    v10->_incidentMessage = v15;

    v17 = v10;
  }

  return v10;
}

- (TransitSegmentSteppingModeSign)initWithWalkingSegment:(id)a3 stepIndexRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  TransitSegmentSteppingModeSign *v9;
  TransitSegmentSteppingModeSign *v10;
  uint64_t v11;
  MNTransitInstruction *instruction;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  MergedTransitRoutingIncidentMessage *v23;
  MergedTransitRoutingIncidentMessage *v24;
  MergedTransitRoutingIncidentMessage *v25;
  MergedTransitRoutingIncidentMessage *incidentMessage;
  TransitSegmentSteppingModeSign *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TransitSegmentSteppingModeSign;
  v9 = -[TransitSegmentSteppingModeSign init](&v33, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_segment, a3);
    v10->_stepIndexRange.location = location;
    v10->_stepIndexRange.length = length;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitInstructionInContext:", 1));
    instruction = v10->_instruction;
    v10->_instruction = (MNTransitInstruction *)v11;

    v13 = objc_alloc_init((Class)NSMutableSet);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "steps", 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitIncidents"));
          v21 = objc_msgSend(v20, "count");

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitIncidents"));
            objc_msgSend(v13, "addObjectsFromArray:", v22);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      v23 = [MergedTransitRoutingIncidentMessage alloc];
      v24 = (MergedTransitRoutingIncidentMessage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      v25 = -[MergedTransitRoutingIncidentMessage initWithTransitIncidents:](v23, "initWithTransitIncidents:", v24);
      incidentMessage = v10->_incidentMessage;
      v10->_incidentMessage = v25;

    }
    else
    {
      v24 = v10->_incidentMessage;
      v10->_incidentMessage = 0;
    }

    v27 = v10;
  }

  return v10;
}

- (BOOL)isWalking
{
  GEOComposedRouteSegment *segment;
  uint64_t v3;

  segment = self->_segment;
  v3 = objc_opt_class(GEOComposedWalkingRouteSegment, a2);
  return objc_opt_isKindOfClass(segment, v3) & 1;
}

- (BOOL)hasValidInstructions
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitInstruction majorInstructionStrings](self->_instruction, "majorInstructionStrings"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (GEOComposedString)majorFormattedInstruction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitInstruction majorInstructionStrings](self->_instruction, "majorInstructionStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (GEOComposedString *)v3;
}

- (GEOComposedString)minorFormattedInstruction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitInstruction minorInstructionStrings](self->_instruction, "minorInstructionStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (GEOComposedString *)v3;
}

- (GEOComposedString)tertiaryFormattedInstruction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNTransitInstruction tertiaryInstructionStrings](self->_instruction, "tertiaryInstructionStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (GEOComposedString *)v3;
}

- (GEOTransitRoutingIncidentMessage)transitRoutingIncidentMessage
{
  return (GEOTransitRoutingIncidentMessage *)self->_incidentMessage;
}

- (GEOComposedTransitTripRouteStep)boardClusteredStep
{
  GEOComposedRouteStep *step;
  uint64_t v4;
  GEOComposedRouteStep *v5;
  void *v6;
  id v7;

  step = self->_step;
  v4 = objc_opt_class(GEOComposedTransitTripRouteStep);
  if ((objc_opt_isKindOfClass(step, v4) & 1) == 0)
    goto LABEL_5;
  v5 = self->_step;
  if (-[GEOComposedRouteStep maneuver](v5, "maneuver") != 3
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep tripSegment](v5, "tripSegment")),
        v7 = objc_msgSend(v6, "rideOptionsCount"),
        v6,
        (unint64_t)v7 <= 1))
  {

LABEL_5:
    v5 = 0;
  }
  return v5;
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (GEOComposedRouteSegment)segment
{
  return self->_segment;
}

- (_NSRange)stepIndexRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_stepIndexRange.length;
  location = self->_stepIndexRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStepIndexRange:(_NSRange)a3
{
  self->_stepIndexRange = a3;
}

- (MNTransitInstruction)instruction
{
  return self->_instruction;
}

- (BOOL)isMatchedSign
{
  return self->_isMatchedSign;
}

- (void)setIsMatchedSign:(BOOL)a3
{
  self->_isMatchedSign = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_segment, 0);
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_incidentMessage, 0);
}

@end
