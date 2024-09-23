@implementation NSInsertionPointHelper

- (void)dealloc
{
  double *logicalPositions;
  double *logicalLeftBoundaries;
  double *logicalRightBoundaries;
  unint64_t *logicalCharIndexes;
  double *displayPositions;
  unint64_t *displayCharIndexes;
  double *logicalAltPositions;
  unint64_t *logicalAltCharIndexes;
  double *displayAltPositions;
  unint64_t *displayAltCharIndexes;
  objc_super v13;

  logicalPositions = self->_logicalPositions;
  if (logicalPositions)
    free(logicalPositions);
  logicalLeftBoundaries = self->_logicalLeftBoundaries;
  if (logicalLeftBoundaries)
    free(logicalLeftBoundaries);
  logicalRightBoundaries = self->_logicalRightBoundaries;
  if (logicalRightBoundaries)
    free(logicalRightBoundaries);
  logicalCharIndexes = self->_logicalCharIndexes;
  if (logicalCharIndexes)
    free(logicalCharIndexes);
  displayPositions = self->_displayPositions;
  if (displayPositions)
    free(displayPositions);
  displayCharIndexes = self->_displayCharIndexes;
  if (displayCharIndexes)
    free(displayCharIndexes);
  logicalAltPositions = self->_logicalAltPositions;
  if (logicalAltPositions)
    free(logicalAltPositions);
  logicalAltCharIndexes = self->_logicalAltCharIndexes;
  if (logicalAltCharIndexes)
    free(logicalAltCharIndexes);
  displayAltPositions = self->_displayAltPositions;
  if (displayAltPositions)
    free(displayAltPositions);
  displayAltCharIndexes = self->_displayAltCharIndexes;
  if (displayAltCharIndexes)
    free(displayAltCharIndexes);
  v13.receiver = self;
  v13.super_class = (Class)NSInsertionPointHelper;
  -[NSInsertionPointHelper dealloc](&v13, sel_dealloc);
}

@end
