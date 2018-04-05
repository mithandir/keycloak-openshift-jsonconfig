FROM jboss/keycloak-openshift

ADD docker-entrypoint.sh /opt/jboss/
ADD userprofile /opt/jboss/keycloak/themes/

ENTRYPOINT [ "openshift-entrypoint.sh" ]

CMD ["start-keycloak.sh", "-b", "0.0.0.0"]
