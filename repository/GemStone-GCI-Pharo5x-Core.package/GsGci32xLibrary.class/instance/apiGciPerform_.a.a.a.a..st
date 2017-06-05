API
apiGciPerform_: receiver a: selectorString a: args a: numArgs a: environmentId
"/* =============================================================================
 * GciPerform , GciPerform_ functions
 *   Send a message to a GemStone object.
 *
 * Input Arguments:
 *   receiver   The OOP of the receiver of the message.
 *   selector   A string that defines the message selector.  For keyword
 *              selectors, all keywords are concatenated in the string. (For
 *              example, at:put:).
 *   args       An array of OOPs.  Each element in the array corresponds to an
 *              argument for the message.  If there are no message arguments,
 *              use a dummy OOP here.
 *   numArgs    The number of arguments to the message.  For unary selectors
 *              (messages with no arguments), numArgs is zero.
 *
 *   flags      zero, or one of bits per GCI_PERFORM_FLAG* in gcicmn.ht
 *
 *   environmentId  a compilation environment identifier, normally zero for Smalltalk
 *
 * Return Value:
 *   Returns the OOP of the result of Smalltalk execution.  In case of error,
 *   this function returns OOP_NIL.
 *
 *  GciSendMsg is replaced by GcIPerform; inline implementations of GciSendMsg are
 *  provided in ./gcisend.hf
 *==============================================================================
 */
  EXTERN_GCI_DEC(OopType)
GciPerform(OopType receiver, const char selector[],
         const OopType args[], int numArgs );
  EXTERN_GCI_DEC(OopType)

GciPerform_(OopType receiver, const char selector[],
         const OopType args[], int numArgs , ushort environmentId);
  EXTERN_GCI_DEC(OopType)

"
	
	^ self ffiCall: #( GsGciOopType GciPerform_(GsGciOopType receiver, String selectorString, ulong args, long numArgs, ushort environmentId) )