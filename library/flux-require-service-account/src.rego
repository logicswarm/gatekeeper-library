package fluxrequireserviceaccount

violation[{"msg": msg}] {
	check_kind(input.review.kind.kind)
	check_service_account(input.review.object.spec)
	msg := sprintf(`'%v' has to specify a serviceAccountName`, [input.review.kind.kind])
}

check_kind(kind) {
	kind == "HelmRelease"
}

check_kind(kind) {
	kind == "Kustomization"
}

check_service_account(spec) {
	spec.serviceAccountName == ""
}

check_service_account(spec) {
	not spec.serviceAccountName
}
