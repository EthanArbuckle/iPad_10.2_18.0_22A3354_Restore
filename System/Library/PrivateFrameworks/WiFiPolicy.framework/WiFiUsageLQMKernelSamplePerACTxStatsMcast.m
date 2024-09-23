@implementation WiFiUsageLQMKernelSamplePerACTxStatsMcast

- (void)transformTXStats
{
  +[WiFiUsageLQMTransformations txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRetries:txForceExpire:](WiFiUsageLQMTransformations, "txErrorsPercentagesWithtxSuccess:txDropped:txNoBuff:txNoRes:txNoAck:txChipModeErr:txExpired:txFail:txFwFree:txMaxRetries:txForceExpire:", self->_txMcastSuccessPerc, self->_txMcastDroppedPerc, self->_txMcastNoBuffPerc, self->_txMcastNoResPerc, self->_txMcastNoAckPerc, self->_txMcastChipModeErrPerc, self->_txMcastExpiredPerc, self->_txMcastFailPerc, self->_txMcastFwFreePerc, self->_txMcastMaxRetriesPerc, self->_txMcastForceExpirePerc);
  self->_txMcast = 0;
  self->_txMcastSuccessPerc = 0;
  self->_txMcastAllFailPerc = 0;
  self->_txMcastDroppedPerc = 0;
  self->_txMcastNoBuffPerc = 0;
  self->_txMcastNoResPerc = 0;
  self->_txMcastNoAckPerc = 0;
  self->_txMcastChipModeErrPerc = 0;
  self->_txMcastExpiredPerc = 0;
  self->_txMcastFailPerc = 0;
  self->_txMcastFwFreePerc = 0;
  self->_txMcastMaxRetriesPerc = 0;
  self->_txMcastForceExpirePerc = 0;
}

- (unint64_t)txMcast
{
  return self->_txMcast;
}

- (unint64_t)txMcastSuccessPerc
{
  return self->_txMcastSuccessPerc;
}

- (unint64_t)txMcastAllFailPerc
{
  return self->_txMcastAllFailPerc;
}

- (unint64_t)txMcastDroppedPerc
{
  return self->_txMcastDroppedPerc;
}

- (unint64_t)txMcastNoBuffPerc
{
  return self->_txMcastNoBuffPerc;
}

- (unint64_t)txMcastNoResPerc
{
  return self->_txMcastNoResPerc;
}

- (unint64_t)txMcastNoAckPerc
{
  return self->_txMcastNoAckPerc;
}

- (unint64_t)txMcastChipModeErrPerc
{
  return self->_txMcastChipModeErrPerc;
}

- (unint64_t)txMcastExpiredPerc
{
  return self->_txMcastExpiredPerc;
}

- (unint64_t)txMcastFailPerc
{
  return self->_txMcastFailPerc;
}

- (unint64_t)txMcastFwFreePerc
{
  return self->_txMcastFwFreePerc;
}

- (unint64_t)txMcastMaxRetriesPerc
{
  return self->_txMcastMaxRetriesPerc;
}

- (unint64_t)txMcastForceExpirePerc
{
  return self->_txMcastForceExpirePerc;
}

@end
